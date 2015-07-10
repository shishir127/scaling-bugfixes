user "#{node[:sahai][:username]}" do
  password node[:sahai][:password]
end

user "#{node[:sahai][:capistrano]}" do
  password node[:sahai][:password]
  home "/home/#{node[:sahai][:capistrano][:user]}"
end

group 'sysadmin' do
  append                     false
  gid                        2365
  members                    ["#{node[:sahai][:username]}", "#{node[:sahai][:capistrano][:user]}"]
  action                     :create
end
