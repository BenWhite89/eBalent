class ContactsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
  	redirect_to root_path
  end
end
