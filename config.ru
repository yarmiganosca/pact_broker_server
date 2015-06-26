require 'fileutils'
require 'logger'
require 'sequel'
require 'pact_broker'
require 'yaml'

DATABASE_CONFIG = YAML.load_file('./database.yml')

app = PactBroker::App.new do |config|
  db_config = DATABASE_CONFIG.merge(logger: config.logger)

  config.database_connection = Sequel.connect(db_config)
end

run app
