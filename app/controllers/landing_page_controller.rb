class LandingPageController < ApplicationController
  def home 
    user_signed_in?
  end

  def tos
  end
end
