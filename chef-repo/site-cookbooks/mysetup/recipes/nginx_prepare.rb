#
# Cookbook Name:: mysetup
# Recipe:: nginx_prepare
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# nginx chefにCentOS　デフォルトのnginx configureを食わせると、tmp_pathで落ちる
# そのため、先にtmp_pathを作っておく

#unless "nginx"
	user "nginx" do
		system true
		shell  '/bin/false'
		home   '/var/www'
	end
#end

directory '/var/lib/nginx/tmp' do
	owner "nginx"
	group "nginx"
	mode '0700'
	action :create
	recursive true
end

