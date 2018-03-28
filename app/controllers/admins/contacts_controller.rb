class Admins::ContactsController < ApplicationController
before_action :authenticate_admin!
layout 'admin.application'

  def index
  end

  def show
  end

  def edit
  end

end
