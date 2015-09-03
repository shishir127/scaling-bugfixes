template "/etc/logrotate.d/rails" do
  source  "rails_logrotate"
  mode "0600"
  owner node[:sahai][:capistrano][:user]
  group node[:sahai][:group]
end

template "/etc/logrotate.d/unicorn" do
  source "unicorn_logrotate"
  mode "0600"
  owner node[:sahai][:capistrano][:user]
  group node[:sahai][:group]
end

template "/etc/logrotate.d/tcp_server" do
  source "tcp_server_logrotate"
  mode "0600"
  owner node[:sahai][:capistrano][:user]
  group node[:sahai][:group]
end
