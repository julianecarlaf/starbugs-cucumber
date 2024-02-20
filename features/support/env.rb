require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.default_max_wait_time= 5
end

Capybara.register_driver :chrome do |app|
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 120
  
    Capybara::Selenium::Driver.new(app, {browser: :chrome, http_client: client})
  end