class ApplicationController < ActionController::Base
  def user_layout
    return 'smp' if request.env["HTTP_USER_AGENT"].include?('toda')
    'application'
  end
end