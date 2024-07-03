resource "digitalocean_domain" "example-domain" {
  name = "example-domainname.com"
}

resource "digitalocean_record" "webserver" {
  domain = digitalocean_domain.example-domain.id
  type   = "A"
  name   = "web"
  value  = digitalocean_droplet.web1.ipv4_address
}
