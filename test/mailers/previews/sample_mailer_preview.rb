# Preview all emails at http://localhost:3000/rails/mailers/sample_mailer
class SampleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sample_mailer/send_when_comment
  def send_when_comment
    SampleMailer.send_when_comment
  end

end
