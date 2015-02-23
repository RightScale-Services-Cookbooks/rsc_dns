#
# Cookbook Name:: rsc_mysql_aws
# Recipe:: default
#
# Copyright (C) 2014 RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "rsc_dns::#{node['rsc_dns']['choice']}"

skip_dns = ["dme"] #don't run dns provider below for these providers

unless skip_dns.include?(node['rsc_dns']['choice'])
  # Create/update DNS records only if all these rsc_dns* attributes are set
  missing_dns_creds = RscDns::Helper.find_missing_dns_credentials(node)
  if missing_dns_creds.empty?
    # Get the dns name and domain name from the FQDN. Split the FQDN into 2 parts
    dns_name, domain_name = node['rsc_dns']['fqdn'].split('.', 2)
    #dns_name ='foo.bar'
    #domain_name = 'rs.hello.com'
    log "Setting DNS entry for the server FQDN #{node['rsc_dns']['fqdn']}..."
    dns dns_name do
      provider node['rsc_dns']['provider']
      dns_provider node['rsc_dns']['dns_provider']
      domain domain_name
      credentials( node['rsc_dns']['credentials'])
      entry_value node['rsc_dns']['ip_address']
      type node['dns']['entry']['type']
      ttl 60
    end
  else
    missing_dns_creds.map! { |cred| "rsc_dns//#{cred}" }
    log "Following DNS credentials are missing #{missing_dns_creds.join(', ')}! Skipping DNS setting..."
  end
end
