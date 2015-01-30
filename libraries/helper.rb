#
# Cookbook Name:: rsc_mysql
# Library:: helper
#
# Copyright (C) 2014 RightScale, Inc.
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

module RscDns
  module Helper
    #include Chef::Mixin::ShellOut

    # Finds the missing DNS credentials to set DNS entry for a the server.
    #
    # @param node [Chef::Node] the chef node
    #
    # @return [Array] the missing DNS credentials
    #
    def self.find_missing_dns_credentials(node)
      missing_creds = []

      ['fqdn', 'access_key', 'secret_access_key'].each do |cred|
        unless node['rsc_dns'][cred] && !node['rsc_dns'][cred].empty?
          missing_creds << cred
        end
      end

      missing_creds
    end

  end
end