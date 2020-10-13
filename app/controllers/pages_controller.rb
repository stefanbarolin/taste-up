class PagesController < ApplicationController
  skip_before_action :authentificate_user!, only: :home
  def home
  end
end
