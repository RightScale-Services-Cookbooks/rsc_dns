node.default['rsc_dns']['dns_provider']='dns_dnsmadeeasy_api20'
node.default['rsc_dns']['credentials'] = {
  'dnsmadeeasy_api_key' => node['rsc_dns']['access_key'],
  'dnsmadeeasy_secret_key' => node['rsc_dns']['secret_access_key']
}
