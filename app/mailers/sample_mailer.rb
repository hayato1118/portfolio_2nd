class SampleMailer < ApplicationMailer

  def send_when_comment(comment,topic)
  	@topic = topic
  	@comment = @topic.topic_comments

  	# @topic_comment = @topic.topic_comment
    mail to:      @topic.user.email,
         subject: 'コメントがつきました。'
  end
end
