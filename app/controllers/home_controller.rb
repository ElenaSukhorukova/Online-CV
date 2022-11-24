class HomeController < ApplicationController
  def index
  end
  def admin
    render :index
  end
end
