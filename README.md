# Example Terraform deployment for Digital Ocean


The terraform example within this repository will setup the following
resources:

    * A Droplet
    * A firewall rule
    * DNS Records


You will need to generate a token on the DigitalOcean control panel 
Head to https://cloud.digitalocean.com/account/api/tokens to start the process


The Generated code will need to be entered in to the
`do-vars.auto.tfvars.example` file and the file renamed to 
`do-vars.auto.tfvars` 

Be Careful not to add it to your git repository

## Droplet Configuration 

The Droplet will be configured with a stored SSH key from the target account
named `terraform-example`
Security updates will be installed on the droplet as well as apache2

An example game from the HashiCorp DigitalOcean Droplet example is downloaded
to the instance and placed for the web server to serve it to users


## Firewall Configuration

The Firewall will allow public access to the http port
It will also allow all outbound traffic

## DNS Records

The domain `example-domainname.com` will be added to the DNS server
A DNS Record will be added for the external IP address of the droplet created


