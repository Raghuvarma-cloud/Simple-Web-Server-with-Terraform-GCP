#configuring vm machine in gcp
resource "google_compute_instance" "instance-template-script" {
  boot_disk {
    auto_delete = true
    device_name = "instance-template-script"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20240307b"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-medium"

  metadata = {
    startup-script = "#! /bin/bash \nsudo su \napt update  \napt -y install apache2 \nsudo service apache2 start \nsudo update-rc.d apache2 enable \necho \"Hello World\" > /var/www/html/index.html \necho \"Hello world from $(hostname) $(hostname -I)\" > /var/www/html/index.html"
  }

  name = "instance-template-script"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/two-project-413318/regions/us-central1/subnetworks/default"
  }

  tags = ["http-server"]
  zone = "us-central1-a"
}
