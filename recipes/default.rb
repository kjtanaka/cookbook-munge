#
# Cookbook Name:: munge
# Recipe:: default
# Author:: Koji Tanaka (<kj.tanaka@gmail.com>)
#
# Copyright 2014, FutureGrid, Indiana Univercity
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "yum-epel"

secrets = Chef::EncryptedDataBagItem.load("munge", "secrets")

munge_key = secrets['munge_key']

packages = %w{munge}

packages.each do |pkg|
	package pkg do
		action :install
	end
end

execute "create_munge_key" do
	command "echo #{munge_key} > /etc/munge/munge.key"
	creates "/etc/munge/munge.key"
end

file "/etc/munge/munge.key" do
	mode "0400"
	user "munge"
	group "munge"
	notifies :restart, "service[munge]", :immediately
end

service "munge" do
	supports :restart => true
	action [:enable, :start]
end
