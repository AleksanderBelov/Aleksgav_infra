#!/bin/bash

APP_EXTERNAL_IP="$(gcloud compute instances describe reddit-app-0  --format="value(networkInterfaces[0].accessConfigs[0].natIP)" --zone=europe-west1-b)"
DB_EXTERNAL_IP="$(gcloud compute instances describe reddit-db-0  --format="value(networkInterfaces[0].accessConfigs[0].natIP)" --zone=europe-west1-b)"
DB_INTERNAL_IP="$(gcloud compute instances describe reddit-db-0  --format="value(networkInterfaces[0].networkIP)" --zone=europe-west1-b)"

cat << EndOfJSON
{
  "app": {
    "hosts": ["${APP_EXTERNAL_IP}"],
    "vars": {
      "db_host": "${DB_INTERNAL_IP}"
    }
  },
  "db": {
    "hosts": ["${DB_EXTERNAL_IP}"]
  }
}
EndOfJSON
