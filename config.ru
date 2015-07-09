require 'fileutils'
require 'logger'
require 'sequel'
require 'pact_broker'
require 'yaml'
require 'clogger'

database_config = YAML.load_file('./database.yml')

app = PactBroker::App.new do |config|
  database_config.merge!(logger: config.logger)
  
  config.database_connection = Sequel.connect(database_config)
end

use(Clogger,
  format:    :Combined,
  logger:    database_config[:logger],
  reentrant: true)
run app
