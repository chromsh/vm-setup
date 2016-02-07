#
# Cookbook Name:: mysetup
# Recipe:: plenv
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


bash "install-plenv" do 
	user "vagrant"
	environment "HOME" => "/home/vagrant"
	code <<-EOS
		cd
		. .bash_profile
		if [ type anyenv ] ; then
			anyenv install plenv
		fi
	EOS
end

bash "install-perl" do 
	user "vagrant"
	environment "HOME" => "/home/vagrant"
	perl	= node['mysetup']['perl']
	code <<-EOS
		cd
		. .bash_profile
		if [ type plenv ] ; then
			plenv install #{perl['version']}
			plenv global  #{perl['version']}
			plenv install-cpanm
		fi
	EOS
	if perl.has_key?(:modules) then 
		code <<-EOS
			cpanm install #{perl['modules'].join(' ')}
		EOS
	end
end
