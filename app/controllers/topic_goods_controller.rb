class TopicGoodsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]
def create
    @topic = Topic.find(params[:topic_id])
    @topic_good = TopicGood.new(
      topic_id: params[:topic_id],
      user_id: current_user.id
    )

    if @topic_good.save
      redirect_to topic_path(@topic)
    else
      render template: 'topics/show'
    end
  end

  def destroy
    @topic_good = TopicGood.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    @topic_good.destroy
    redirect_to topic_path(params[:topic_id])
  end

  private
    def topic_good_params
      params.require(:topic_good).permit(:topic_id, :user_id)
    end

end


