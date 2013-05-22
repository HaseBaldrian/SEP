require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "registration_received" do
    mail = Notifier.registration_received(users(:one))
    assert_equal "Registration Confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["loginsystem@example.com"], mail.from
    assert_match "Thanks for registration.", mail.body.encoded
  end

end
