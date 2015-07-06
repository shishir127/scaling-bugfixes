user "#{node[:sahai][:username]}" do
  home "/home/#{node[:sahai][:username]}"
  password node[:sahai][:password]
end

group 'sysadmin' do
  append                     false
  gid                        2365
  members                    ["#{node[:sahai][:username]}"]
  action                     :create
end
