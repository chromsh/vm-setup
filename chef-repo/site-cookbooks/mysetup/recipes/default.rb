#
# Cookbook Name:: mysetup
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%W{libxml2-devel libxslt-devel gd-devel vim telnet mailx}.each do |pkg|
	package "#{pkg}" do
		action :install
	end
end

yum_package "git" do
	action :install
	options "--enablerepo=rpmforge-extras"
end

yum_package "lv" do
	action :install
	options "--enablerepo=rpmforge"
end

link '/etc/localtime' do
	to "/usr/share/zoneinfo/#{node['mysetup']['timezone']}"
end

%W{.bashrc .bash_profile}.each do |f|
	cookbook_file "/home/vagrant/#{f}" do 
		source "#{f}"
		owner "vagrant"
		group "vagrant"
		mode "0755"
	end
end
