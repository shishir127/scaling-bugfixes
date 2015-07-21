file "/etc/apt/sources.list.d/newrelic.list" do
  content "deb http://apt.newrelic.com/debian/ newrelic non-free"
end

execute "wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -"
execute "apt-get -y update"
package ["newrelic-sysmond"]
execute "nrsysmond-config --set license_key=#{node[:newrelic][:license_key]}"
execute "/etc/init.d/newrelic-sysmond start"
