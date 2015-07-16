directory "#{node[:newrelic][:aws_cloudwatch][:install_path]}" do
  group node[:sahai][:group]
  owner node[:newrelic][:aws_cloudwatch][:user]
  mode 0740
  recursive true
end

install_plugin 'newrelic_aws_cloudwatch_plugin' do
  plugin_version   node[:newrelic][:aws_cloudwatch][:version]
  install_path     node[:newrelic][:aws_cloudwatch][:install_path]
  plugin_path      node[:newrelic][:aws_cloudwatch][:plugin_path]
  download_url     node[:newrelic][:aws_cloudwatch][:download_url]
  user             node[:newrelic][:aws_cloudwatch][:user]
end

# newrelic template
template "#{node[:newrelic][:aws_cloudwatch][:plugin_path]}/config/newrelic_plugin.yml" do
  source 'newrelic_plugin.yml.erb'
  action :create
  owner node[:newrelic][:aws_cloudwatch][:user]
  # notifies :restart, 'service[newrelic-aws-cloudwatch-plugin]'
end

# install init.d script and start service
plugin_service 'newrelic-aws-cloudwatch-plugin' do
  daemon          './bin/newrelic_aws'
  daemon_dir      node[:newrelic][:aws_cloudwatch][:plugin_path]
  plugin_name     'AWS Cloudwatch'
  plugin_version  node[:newrelic][:aws_cloudwatch][:version]
  user            node[:newrelic][:aws_cloudwatch][:user]
  run_command     'bundle exec'
end