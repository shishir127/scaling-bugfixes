user "#{node[:sahai][:username]}" do
  home "/home/#{node[:sahai][:username]}"
  password default[:sahai][:password]
end

group 'sysadmin' do
  append                     false
  excluded_members           Array
  gid                        2365
  members                    [node[:sahai][:username]]
  action                     :create
end
