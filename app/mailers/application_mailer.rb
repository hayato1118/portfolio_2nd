class ApplicationMailer < ActionMailer::Base
  # default from: 'from@example.com'
  # layout 'mailer'
  	default from:     "from@example.com",
			bcc:      "minnano.memo@gmail.com",
			# reply_to: "code.cellars.seller@gmail.com"
          	reply_to: "minnano.memo@gmail.com"
	layout 'mailer'
end
