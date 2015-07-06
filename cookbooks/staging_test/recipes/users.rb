user "deployer" do
  home "/home/deployer"
  password default[:sahai][:password]
end

group 'sysadmin' do
  append                     false
  excluded_members           Array
  gid                        2365
  members                    ["deployer"]
  action                     :create
end
