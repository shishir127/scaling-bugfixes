directory "/home/#{node[:sahai][:capistrano][:user]}/.ssh" do
  group node[:sahai][:group]
  owner node[:sahai][:capistrano][:user]
  mode 0700
  action :create
end

template "/home/#{node[:sahai][:capistrano][:user]}/.ssh/authorized_keys" do
  source  'authorized_keys'
  mode '0600'
  owner node[:sahai][:capistrano][:user]
  group node[:sahai][:group]
end

execute "ssh-keyscan -H github.com >> ~/.ssh/known_hosts" do
  user node[:sahai][:capistrano][:user]
end

directory "#{node[:sahai][:project_home]}" do
  group node[:sahai][:group]
  owner node[:sahai][:capistrano][:user]
  mode 0755
  action :create
  recursive true
end

directory "#{node[:sahai][:project_home]}/shared" do
  group node[:sahai][:group]
  owner node[:sahai][:capistrano][:user]
  mode 0755
  action :create
  recursive true
end

directory "#{node[:sahai][:project_home]}/shared/config" do
  group node[:sahai][:group]
  owner node[:sahai][:capistrano][:user]
  mode 0755
  action :create
  recursive true
end

template "#{node[:sahai][:project_home]}/shared/config/database.yml" do
  source 'database.yml.erb'
end

template "#{node[:sahai][:project_home]}/shared/config/secrets.yml" do
  source 'secrets.yml.erb'
end
