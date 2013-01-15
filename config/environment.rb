# Load the rails application
require File.expand_path('../application', __FILE__)

# load environment variables
environment_variables = File.join(Rails.root, 'config', 'environment_variables.rb')
load(environment_variables) if File.exists?(environment_variables)

# Initialize the rails application
Blueprint::Application.initialize!
