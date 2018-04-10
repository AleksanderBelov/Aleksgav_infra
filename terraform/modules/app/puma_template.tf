data "template_file" "reddit_app" {
  template = "${file("${path.module}/files/puma.service.tpl")}"

  vars {
    reddit_db_addr = "${var.reddit_db_addr}"
  }
}
