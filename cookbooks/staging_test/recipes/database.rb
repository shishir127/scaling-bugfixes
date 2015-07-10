include_recipe "postgresql::client"
include_recipe "postgresql::server"

package ["libpq-dev", "postgresql", "postgresql-contrib"]
