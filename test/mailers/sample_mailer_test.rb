require 'test_helper'

class SampleMailerTest < ActionMailer::TestCase
  test "send_when_comment" do
    mail = SampleMailer.send_when_comment
    assert_equal "Send when comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
