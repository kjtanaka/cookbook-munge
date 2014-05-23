#
# Cookbook Name:: munge
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

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
