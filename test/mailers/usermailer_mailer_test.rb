require 'test_helper'

class UsermailerMailerTest < ActionMailer::TestCase
  test "sample email" do
    candidate = candidates(:one)

    email = UsermailerMailer.with(candidate: candidate).sample_email

    assert_emails 1 do
      email.deliver_now
    end
  end
end
