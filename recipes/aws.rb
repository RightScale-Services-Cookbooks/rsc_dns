node.default['rsc_dns']['dns_provider']='AWS'
node.default['rsc_dns']['credentials'] = {
  'aws_access_key_id' => node['rsc_dns']['user'],
  'aws_secret_access_key' => node['rsc_dns']['password']
}
