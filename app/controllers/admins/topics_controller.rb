class Admins::TopicsController < ApplicationController
before_action :authenticate_admin!
layout 'admin.application'

  def index
    @topics = Topic.all.order(created_at: :desc)
  end

private
    def topic_params
      params.require(:topic).permit(:author ,:paragraph,:posted_day, :one_total, :re_body,:title,:url,:body,:topic_image, :tags_attributes => [:id, :tag_name, :topic_id, :_destroy],category_ids: [])
    end
end
