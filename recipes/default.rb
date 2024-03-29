#
# Author:: J.D. Hollis (http://densityofspace.com)
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2011, J.D. Hollis
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"

case node[:platform]
  when "centos","redhat","fedora"
    package "openssl-devel"
  when "debian","ubuntu"
    package "libssl-dev"
end

bash "install nodejs from source" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    wget #{ archive_url_for node[:nodejs][:version] }  && \
    tar zxf node-v#{ node[:nodejs][:version] }.tar.gz && \
    cd node-v#{ node[:nodejs][:version] } && \
    ./configure --prefix=#{ node[:nodejs][:dir] } && \
    make && \
    make install
  EOH
  not_if "#{ node[:nodejs][:dir] }/bin/node -v 2>&1 | grep 'v#{ node[:nodejs][:version] }'"
end
