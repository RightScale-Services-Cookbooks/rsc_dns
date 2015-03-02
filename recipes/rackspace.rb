include_recipe "dns::fog"

node.default['rsc_dns']['dns_provider']='rackspace'
node.default['rsc_dns']['credentials'] = {
  'rackspace_username' => node['rsc_dns']['access_key'],
  'rackspace_api_key' => node['rsc_dns']['secret_access_key']
}
