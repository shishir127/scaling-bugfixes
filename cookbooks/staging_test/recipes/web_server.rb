template "/tmp/nginx_tcp_proxy_setup.sh" do
  source "nginx_tcp_proxy_setup"
  mode "0754"
end

template "/tmp/nginx_build_flag_editor.rb" do
  source "nginx_build_flag_editor.rb"
  mode "0754"
end

bash "build nginx" do
  action :run
  code "/tmp/nginx_tcp_proxy_setup.sh"
end

directory "/usr/share/nginx/logs" do
  group node[:sahai][:group]
  owner node[:sahai][:username]
  mode 0777
  action :create
  recursive true
end

file '/usr/share/nginx/logs/tcp_access.log'

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
end

template "/etc/nginx/sites-available/default" do
  source "sahai-web"
end

execute "service nginx restart"