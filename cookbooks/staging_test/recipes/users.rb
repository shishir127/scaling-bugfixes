user "#{node[:sahai][:username]}" do
  password node[:sahai][:password]
end

user "#{node[:sahai][:application]}" do
  password node[:sahai][:password]
end

group 'sysadmin' do
  append                     false
  gid                        2365
  members                    ["#{node[:sahai][:username]}", "#{node[:sahai][:application]}"]
  action                     :create
end
