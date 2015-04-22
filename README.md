# rsc_dns cookbook
Use this cookbook to dynamicly update DNS providers with the servers private or public IP.  

### providers
* DNS Made Easy api 2.0, choice: dme2
* DNS Made Easy 1.0 API, choice: dme
* AWS Route 53, aws

### Requirements
Uses this dns cookbook: https://github.com/rightscale-cookbooks-contrib/dns.git

### Usage

Add `rsc_dns::default` to your runlist.  Use the node["rsc_dns"]["choice"]  attribute to select your DNS provider.  
When selecting choice 'dme' you need to provide the dns_id instead of the fqdn.

### Attributes
* node["rsc_dns"]["ip_address"] - The private or public IP for the dns name.
* node["rsc_dns"]["fqdn"] - The FQDN used for this server.  required for DME2 and AWS
* node["rsc_dns"]["access_key"] - The cloud access key or username to authenticate with DNS service
* node["rsc_dns"]["secret_access_key"] - Secret Key or password to authenticate with DNS service
* node["rsc_dns"]["choice"] - The DNS provider. dme is the DNS Made Easy basic account, dme2 required Business account

### Recipes
