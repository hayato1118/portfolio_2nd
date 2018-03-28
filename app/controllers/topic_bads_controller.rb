class TopicBadsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]
def create
    @topic = Topic.find(params[:topic_id])
    @topic_bad = TopicBad.new(
      topic_id: params[:topic_id],
      user_id: current_user.id
    )

    if @topic_bad.save
      redirect_to topic_path(@topic)
    else
      render template: 'topics/show'
    end
  end


  def destroy
    @topic_bad = TopicBad.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    @topic_bad.destroy
    redirect_to topic_path(params[:topic_id])
  end

  private
    def topic_bad_params
      params.require(:topic_bad).permit(:topic_id, :user_id)
    end


end
