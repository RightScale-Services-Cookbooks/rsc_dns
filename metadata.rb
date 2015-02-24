name             'rsc_dns'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc_mysql_aws'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'dns', '~> 0.1.3'

recipe "rsc_dns::default", "Update DNS with with IP"

attribute 'rsc_dns/ip_address',
  :display_name => 'IP address ',
  :description => "The IP address to use for DNS name",
  :required => 'required',
  :recipes => ['rsc_dns::default']

attribute 'rsc_dns/fqdn',
  :display_name => 'Fully Qualified Domain Name',
  :description => "The DNS name to update, required for dme2, and aws.  For aws",
  :required => 'optional',
  :recipes => ['rsc_dns::default']

attribute 'rsc_dns/access_key',
  :display_name => 'Access key',
  :description => "Access Key or username to authenticate with DNS service",
  :required => 'required',
  :recipes => ['rsc_dns::default']

attribute 'rsc_dns/secret_access_key',
  :display_name => 'Secret key',
  :description => "Secret Key or password to authenticate with DNS service",
  :required => 'required',
  :recipes => ['rsc_dns::default']

attribute 'rsc_dns/choice',
  :display_name => 'Choose the DNS Provider',
  :description => "The DNS provider. dme is the DNS Made Easy basic account, dme2 required Business account",
  :choice=> ["dme","dme2","aws"],
  :required => 'required',
  :recipes => ['rsc_dns::default']

attribute 'rsc_dns/dns_id',
  :display_name => 'DNS ID',
  :description => "The DNS provider ID for the dns name. Used for dme.",
  :required => 'optional',
  :recipes => ['rsc_dns::default']
