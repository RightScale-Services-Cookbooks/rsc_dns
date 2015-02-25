include_recipe 'dns::fog'
node.default['rsc_dns']['dns_provider']='google'
node.default['rsc_dns']['credentials'] = {
  'google_client_email' => node['rsc_dns']['access_key'],
  'google_key_location' => "#{Chef::Config[:file_cache_path]}/key.pk12"
  'google_key_string' => node['rsc_dns']['secret_access_key']
}
