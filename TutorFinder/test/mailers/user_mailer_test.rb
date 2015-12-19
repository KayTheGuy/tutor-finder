require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "appointment_request" do
    mail = UserMailer.appointment_request
    assert_equal "Appointment request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "signup_confirmation" do
    mail = UserMailer.signup_confirmation
    assert_equal "Signup confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
