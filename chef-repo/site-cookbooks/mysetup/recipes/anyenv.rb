#
# Cookbook Name:: mysetup
# Recipe:: anyenv
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


bash "install-anyenv" do 
	user "vagrant"
	environment "HOME" => "/home/vagrant"
	code <<-EOS
		git clone https://github.com/riywo/anyenv.git
		git clone https://github.com/riywo/anyenv ~/.anyenv
		echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
		echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
		exec $SHELL -l
	EOS
	#not_if "test -e ~/.anyenv"
	not_if "test -e /home/vagrant/.anyenv"
end
