class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
    flash[:notice] = "お問い合わせ完了しました。"
    redirect_to topics_path
    else
    flash[:notice] = "入力項目に不備があります。"
    redirect_to topics_path
    end
  end


private
    def contact_params
      params.require(:contact).permit(:title,:body,:email)
    end
end

