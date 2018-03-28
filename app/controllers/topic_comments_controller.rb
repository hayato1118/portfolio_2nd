class TopicCommentsController < ApplicationController
before_action :authenticate_user!
	
def create
    topic = Topic.find(params[:topic_id])
    comment = current_user.topic_comments.new(topic_comment_params)
    comment.topic_id = topic.id
    comment.save
    redirect_to topic_path(topic)
end


def destroy
	@topic = Topic.find(params[:topic_id])
	@topic_comment = @topic.topic_comments.find(params[:id])
	@topic_comment.destroy
	redirect_to topic_path(@topic)
end

private
	def topic_comment_params
	  params.require(:topic_comment).permit(:user_id,:topic_id,:comment)
	end
end
