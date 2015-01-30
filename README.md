# rsc_dns cookbook

This cookbook is used to update dns records 
### providers
* DNS Made Easy api 2.0, choice: dme
* DNS Made Easy 1.0 API, choice: dme
* AWS Route 53, aws

# Requirements
Uses this dns cookbook: https://github.com/rightscale-cookbooks-contrib/dns.git

# Usage

Add rsc_dns::default to your runlist.  Select the rsc_dns/choice for your DNS provider.  
When selecting choice 'dme' you need to provide the dns_id instead of the fqdn.

# Attributes

# Recipes

# Author

Author:: RightScale Inc (<premium@rightscale.com>)
