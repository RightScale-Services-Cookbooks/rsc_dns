chef_gem 'fog'


dns_name, domain_name = node['rsc_dns']['fqdn'].split('.', 2)

dns_id = node['rsc_dns']['dns_id']

get_method_query="username=#{node['rsc_dns']['access_key']}" +
  "&password=#{node['rsc_dns']['secret_access_key']}" +
  "&id=#{dns_id}" +
  "&ip=#{node['rsc_dns']['ip_address']}"

#this doesn't work because it sends the message param along with the request.  and DME 
#returns 404 not found.
#
#http_request dns_name do
#  action :post
#  url "https://cp.dnsmadeeasy.com/servlet/updateip"
#  message get_method_query
#end
package "curl"

url='http://cp.dnsmadeeasy.com/servlet/updateip'
bash "dns request" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  curl -v -L -d \"#{get_method_query}\"  #{url}
  EOH
end