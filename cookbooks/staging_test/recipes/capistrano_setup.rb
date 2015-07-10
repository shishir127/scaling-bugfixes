directory "/home/#{node[:sahai][:capistrano][:user]}/.ssh" do
  mode 0755
  action :Create
end

file "/home/#{node[:sahai][:capistrano][:user]}/.ssh/authorized_keys" do
  content node[:sahai][:capistrano][:key]
  mode '0600'
  owner node[:sahai][:capistrano][:user]
  group node[:sahai][:group]
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

directory "#{node[:sahai][:project_home]}/releases" do
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