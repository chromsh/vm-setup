# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/centos-6.7"

  config.vm.network "private_network", ip: "192.168.33.10"


  #config.omnibus.chef_version = "12.5.1"
  config.omnibus.chef_version = :latest
  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = ["chef-repo/cookbooks"]
	chef.nodes_path	= ""
	chef.run_list = [
		"yum-epel",
		"yum-repoforge",
		"yum-remi",
		"mysetup",
		"mysetup::anyenv",
		"mysetup::nginx_prepare",
		"nginx::source",

		"mysetup::plenv",
		"selinux::disabled",
	]
	chef.json	= {
		selinux: {
			status: "disabled"
		},
		mysetup: {
			timezone: "Asia/Tokyo",
			perl: {
				version: "5.22.1"
			}
		},
		nginx: {
			version: "1.9.10",
			configure_flags: [
				"--prefix=/usr/share/nginx",
				"--sbin-path=/usr/sbin/nginx",
				"--conf-path=/etc/nginx/nginx.conf",
				"--error-log-path=/var/log/nginx/error.log",
				"--http-log-path=/var/log/nginx/access.log",
				"--http-client-body-temp-path=/var/lib/nginx/tmp/client_body",
				"--http-proxy-temp-path=/var/lib/nginx/tmp/proxy",
				"--http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi",
				"--http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi",
				"--http-scgi-temp-path=/var/lib/nginx/tmp/scgi",
				"--pid-path=/var/run/nginx.pid",
				"--lock-path=/var/lock/subsys/nginx",
				"--user=nginx",
				"--group=nginx",
				"--with-file-aio",
				"--with-ipv6",
				"--with-http_ssl_module",
				"--with-http_realip_module",
				"--with-http_addition_module",
				"--with-http_xslt_module",
				"--with-http_image_filter_module",
				"--with-http_sub_module",
				"--with-http_dav_module",
				"--with-http_flv_module",
				"--with-http_mp4_module",
				"--with-http_gzip_static_module",
				"--with-http_random_index_module",
				"--with-http_secure_link_module",
				"--with-http_degradation_module",
				"--with-http_stub_status_module",
				"--with-mail",
				"--with-mail_ssl_module",
				"--with-debug",
				"--with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic'",
				"--with-ld-opt=-Wl,-E",
				"--with-http_v2_module",
			],
			source: {
				sbin_path: "/usr/sbin/nginx",
				checksum: "fb14d76844cab0a5a0880768be28965e74f9956790f618c454ef6098e26631d9"
			}
		}
	}
  end
end
