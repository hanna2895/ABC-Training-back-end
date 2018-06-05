class WelcomeController < ApplicationController
  def index
    puts 'working'
    render "welcome/index.html.erb"
  end
end
