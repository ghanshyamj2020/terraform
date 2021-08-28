terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"

  project = "tranquil-sunup-322211"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_firewall" "firewall" {
  name    = "gritfy-firewall-externalssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] # Not So Secure. Limit the Source Range
  target_tags   = ["externalssh"]
}

resource "google_compute_firewall" "webserverrule" {
  name    = "gritfy-webserver"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }

  source_ranges = ["0.0.0.0/0"] # Not So Secure. Limit the Source Range
  target_tags   = ["webserver"]
}

# We create a public IP address for our google compute instance to utilize
resource "google_compute_address" "static" {
  name = "vm-public-address"
  project = "tranquil-sunup-322211"
  region = "us-central1"
  depends_on = [ google_compute_firewall.firewall ]
}


resource "google_compute_instance" "dev" {
  name         = "devserver" # name of the server
  machine_type = "f1-micro" # machine type refer google machine types
  zone         = "us-central1-a" # `a` zone of the selected region in our case us-central-1a
  tags         = ["externalssh","webserver"] # selecting the vm instances with tags

  # to create a startup disk with an Image/ISO. 
  # here we are choosing the CentOS7 image
  boot_disk { 
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  # We can create our own network or use the default one like we did here
  network_interface {
    network = google_compute_network.vpc_network.name

    # assigning the reserved public IP to this instance
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  
