class Admins::ContactsController < ApplicationController
before_action :authenticate_admin!
layout 'admin.application'

  def index
  	@contacts = Contact.all.order(created_at: :desc)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy
        flash[:notice] = "お問い合わせを削除しました。"
        redirect_to admins_top_path
  end

private
    def contact_params
      params.require(:contact).permit(:title,:body,:email)
    end
end
