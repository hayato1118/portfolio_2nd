# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
 layout 'admin.application'
 before_action :screen_user
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # 認証が失敗した場合に呼び出されるアクション
  def failed
    # warden で出力されたエラーを保存する
    flash[:notice] = "管理者ログイン失敗しました。"
    redirect_to topics_path
  end

  protected
  def auth_options
    # 失敗時に recall に設定したパスのアクションが呼び出されるので変更
    # { scope: resource_name, recall: "#{controller_path}#new" } # デフォルト
    { scope: resource_name, recall: "#{controller_path}#failed" }
  end

def screen_user
      unless user_signed_in? || admin_signed_in?
        redirect_to root_path
      end
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
