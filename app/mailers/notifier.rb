class Notifier < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.registration_received.subject
  #
  
  def event_taken event
    @event = event 
    mail :to => event.user.email, :subject => "Veranstaltung ausgebucht"
  end
  
  def event_created event
    @event = event
    mail :to => event.user.email, :subject => "Veranstaltung erstellt"
  end
  
  def registration_received registration
    @registration = registration
    @event = registration.event
    @user = @event.user
    mail :to => registration.email, :reply_to => @user.email, :subject => "Anmeldung erfolgreich"
  end
  
  def registration_received_waitlist registration
    @registration = registration
    @event = registration.event
    @user = @event.user
    mail :to => registration.email, :reply_to => @user.email, :subject => "Anmeldung auf Warteliste"
  end
  
  def registration_cancelled event, email
    @event = event
    mail :to => email, :reply_to => @event.user.email, :subject => "Abmeldung erfolgreich"
  end
  
  def registration_move_up registration
    @registration = registration
    @event = registration.event
    @user = @event.user
    mail :to => registration.email, :reply_to => @user.email, :subject => "Nachrueckplatz erhalten"
  end
end
