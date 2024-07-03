data "digitalocean_ssh_key" "terraform" {
  name = "terraform-example"
}

resource "digitalocean_droplet" "web1" {
  name     = "example-web"
  image    = "debian-12-x64"
  region   = "fra1"
  size     = "s-1vcpu-512mb-10gb"
  tags     = [
    "example",
    "SandA",
    "devops"
  ]
  user_data = file("user_data.script")
  ssh_keys  = [
    data.digitalocean_ssh_key.terraform.id
  ]

}


resource "digitalocean_firewall" "web" {
  name = "All-web"

  droplet_ids = [
    digitalocean_droplet.web1.id
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

    outbound_rule {
      protocol              = "tcp"
      port_range            = "443"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
    outbound_rule {
      protocol              = "tcp"
      port_range            = "80"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
    outbound_rule {
      protocol              = "tcp"
      port_range            = "53"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
    outbound_rule {
      protocol              = "udp"
      port_range            = "53"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"
      ]
    }

  }

output "Droplet-ip" {
  description = "The resulting droplet IP address"
  value       = digitalocean_droplet.web1.ipv4_address
}

