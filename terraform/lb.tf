resource "google_compute_instance_group" "reddit_app_group" {
  name        = "reddit-app-group"
  description = "Group for load balancind reddit instances"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  named_port {
    name = "http"
    port = "9292"
  }

  zone = "${var.zone}"
}

resource "google_compute_firewall" "firewall_load_balancer" {
  name        = "allow-load-balancer"
  network     = "default"
  target_tags = ["reddit-app"]

  allow {
    protocol = "tcp"
  }
}

resource "google_compute_http_health_check" "http_check" {
  name               = "http-check"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
  port               = "9292"
}

resource "google_compute_backend_service" "reddit_app_backend" {
  name                            = "reddit-app-backend"
  port_name                       = "http"
  protocol                        = "HTTP"
  timeout_sec                     = 10
  connection_draining_timeout_sec = 20
  health_checks                   = ["${google_compute_http_health_check.http_check.self_link}"]

  backend {
    group = "${google_compute_instance_group.reddit_app_group.self_link}"
  }
}

resource "google_compute_url_map" "reddit_app_url_map" {
  name            = "reddit-app-url-map"
  default_service = "${google_compute_backend_service.reddit_app_backend.self_link}"
}

resource "google_compute_target_http_proxy" "reddit_app_http_proxy" {
  name    = "reddit-app-http-proxy"
  url_map = "${google_compute_url_map.reddit_app_url_map.self_link}"
}

resource "google_compute_global_forwarding_rule" "reddit_app_forwarding_rule" {
  name       = "reddit-app-forwarding-rule"
  target     = "${google_compute_target_http_proxy.reddit_app_http_proxy.self_link}"
  port_range = "80"
}
