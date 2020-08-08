class ApplicationController < ActionController::Base

  protected

  def redirect_to_root
    redirect_to root
  end
  
end
