puts "Using native SQLServer"
require "active_record"
require 'logger'

ENV['ADAPTER'] = 'sqlserver'

# Prepend oracle_enhanced local development directory in front of load path
# $LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../../../oracle-enhanced/lib"

ActiveRecord::Base.configurations = {
  'unit' => {
    :adapter  => 'sqlserver',
    :username => 'hrtappadmin',
    :password => 'hrtbetaadmin',
    :mode => 'odbc',
    :dsn => 'hrt_beta'
  }
}