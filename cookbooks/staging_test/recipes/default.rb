include_recipe 'staging_test::base'
include_recipe 'staging_test::users'
include_recipe 'staging_test::rails_stack'
include_recipe 'staging_test::web_server'
include_recipe 'staging_test::database'
include_recipe 'staging_test::capistrano_setup'
include_recipe 'staging_test::application_server'
include_recipe 'staging_test::newrelic_aws_plugin'
