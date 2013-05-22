class Notifier < ActionMailer::Base
  default from: 'Sam Ruby <loginsystem@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.registration_received.subject
  #
  def registration_received(user)
    @user = user

    mail :to => user.email, :subject => "Registration Confirmation"
  end
end
