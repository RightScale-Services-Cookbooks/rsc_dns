node.default['rsc_dns']['dns_provider']='default'
node.default['rsc_dns']['credentials'] = {
  'aws_access_key_id' => node['rsc_dns']['access_key'],
  'aws_secret_access_key' => node['rsc_dns']['secret_access_key']
}
