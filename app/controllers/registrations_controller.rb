class RegistrationsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:new, :create, :edit, :update, :show, :destroy]
  skip_before_filter :authorize2, :only => [:new, :create, :edit, :update, :show, :destroy, :index]
  
  def new
    @registration = Registration.new
   
    if (params[:id]) 
      @event = Event.find_by_link(params[:id].downcase) 
    elsif Event.exists?(params[:event_id]) && User.exists?(params[:user_id])
      @event = Event.find(params[:event_id]) 
    end
    
    # falls Event gefunden wird, also nicht 404
    if @event 
      @user = @event.user
      @questions = @event.questions.find(:all, :order => 'position')
      
      # questions position updaten (wichtig, sonst passen die options spaeter nicht zu ihren answers!)
      i=0
      @questions.each do |q|
        q.update_attributes(:position => i)
        i+=1
        @a = @registration.answers.build(:question_id => q.id, :position => q.position)
      end
    end
    
    respond_to do |format|
      unless @event
        format.html { render :status => 404, :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      else 
        format.html 
      end
    end
  end
  
  def create
    
    @event = Event.find(params[:event_id])
    @user = @event.user
    @questions = @event.questions.find(:all, :order => 'position')
    
    if !params[:registration][:answers_attributes].blank?
      # params auseinandernehmen (type separieren und options einspeissen)
      detached_params = detach_answers_and_types_params
      answers_params = detached_params.delete('answers')
      type_params = detached_params.delete('types')
      
      # options zu detach_params dazu
      options_params = detach_options_params(answers_params.count)
      match_answers_and_options answers_params, options_params
      
      # detach_params wieder zu registration_params dazu
      if answers_params
        params[:registration].merge!("answers_attributes" => answers_params)
      end 
    end
    
    @registration = @event.registrations.create(params[:registration]) 
    
    # type fuer Antworten setzen
    answers =  @registration.answers 
    i=0
    answers.each do |a|
      a.type = type_params.delete(i.to_s)
      i+=1
    end 
        
    respond_to do |format|
      if @registration.save
        
        # falls der letzte Platz belegt wurde: Infomail an @event.user
        if @event.registrations.all.count == @event.max_registration_count
          Notifier.event_taken(@event).deliver
        end
        
        # Email: Bestaetigung Eingang der Anmeldung
        if waitlist(@registration) # Wartelistenplatz
          Notifier.registration_received_waitlist(@registration).deliver
        else # Anmeldebestaetigung
          Notifier.registration_received(@registration).deliver
        end
        
        format.html { redirect_to user_event_registration_path(@user, @event, @registration, :mail => @registration.email), notice: 'Anmeldung erfolgreich.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def show  
    # prüfen, ob emailadresse zur registration-id passt
    if Registration.exists?(params[:id])
      if Registration.find(params[:id]) == Registration.find_by_email(params[:mail])
        @registration = Registration.find(params[:id])
      end
    end
    
    if @registration # auf die prüfung von user/event wird verzichtet
      @event = @registration.event
      @user = @event.user
      
      @waitlist = waitlist(@registration)
      
      # answers nach position sortieren
      @answers = @registration.answers.find(:all, :order => 'position')
   end
    
    respond_to do |format|
      unless @registration # falls also fehler in der adresse, dann wurde @registration nicht initialisiert
        format.html { render :status => 404, :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      else
        format.html
      end
    end
  end
  
  def index
    @event = Event.find(params[:event_id])
    @user = @event.user
    @registrations = @event.registrations.find(:all, :order => 'created_at') 
    
    # questions nach position sortieren
    @questions = @event.questions.find(:all, :order => 'position') 
    
    respond_to do |format|
      unless session[:user_id] == 1 || session[:user_id] == @event.user_id
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else 
        format.html
        format.csv { send_data Registration.to_csv(@registrations) }
      end
    end
  end
  
  def edit
    # prüfen, ob emailadresse zur registration-id passt
    if Registration.exists?(params[:id])
      if Registration.find(params[:id]) == Registration.find_by_email(params[:mail])
        @registration = Registration.find(params[:id])
      end
    end
    
    if @registration # auf die prüfung von user/event wird verzichtet
      @event = @registration.event
      @user = @event.user
      
      @waitlist = waitlist(@registration)
    end   
    
    respond_to do |format|
      unless @registration # falls also fehler in der adresse, dann wurde @registration nicht initialisiert
        format.html { render :status => 404, :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      else
        format.html
      end
    end
  end
  
def update
    @registration = Registration.find(params[:id])
    @event = @registration.event
    @user = @event.user
    
    if !params[:registration][:answers_attributes].blank?
      # params auseinandernehmen (type separieren und options einspeissen)
      detached_params = detach_answers_and_types_params
      answers_params = detached_params.delete('answers')
      
      # options zu detach_params dazu
      options_params = detach_options_params(answers_params.count)
      match_answers_and_options answers_params, options_params
      
      # detach_params wieder zu registration_params dazu
      if answers_params
        params[:registration] = params[:registration].merge("answers_attributes" => answers_params)
      end 
    end 
    
    answers = @registration.answers.all
    answers.each do |a|
      if a.type == "OptAnswer"
        a.update_attributes(:input => "")
      end  
    end
    
    respond_to do |format|
      if @registration.update_attributes(params[:registration])    
        format.html { redirect_to user_event_registration_path(@user, @event, @registration, :mail => @registration.email), notice: 'Aenderungen erfolgreich eingetragen.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    # prüfen, ob emailadresse zur registration-id passt
    if Registration.exists?(params[:id])
      if Registration.find(params[:id]) == Registration.find_by_email(params[:mail])
        registration = Registration.find(params[:id])
      end
    end
    
    if registration # auf die prüfung von user/event wird verzichtet
      @event = registration.event
      @user = @event.user

        # email fuer infomail speichern
      email = registration.email 
      
      registration.destroy
      
        # questions,registrations für tabellen-update
      @questions = @event.questions.find(:all, :order => 'position')
      @registrations = @event.registrations.all
      
        # Information an Nachruecker 
        # (position im array: max_registration_count-1, da durch destroy das array kleiner wird!)
      if @registrations[@event.max_registration_count-1] != nil &&  @event.max_registration_count != -1 
        Notifier.registration_move_up(registrations[@event.max_registration_count-1]).deliver
      end
        # Abmeldebestaetigung
      Notifier.registration_cancelled(@event,email).deliver
    end
    
    respond_to do |format|
      unless @user # falls also fehler in der adresse, dann wurde @user nicht initialisiert
        format.html { render :status => 404, :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      else
        unless session[:user_id] 
          format.html { redirect_to new_user_event_registration_path(@user,@event), notice: 'Abmeldung erfolgreich.' } 
        else
          format.html { redirect_to user_event_registrations_path(@user,@event) }
          format.js 
        end
      end
    end
  end
  
  private
  
  # answers und types aus params entfernen
  # answers_params: alle attribute ohne :type, {"0" => {...}, "1" => {...}, ...}
  # type_params: alle antwort-typen, {"0" => {:type => TextAnswer}, "1" => {:type => ...}, ...}
  # returns: {"answers" => ansers_params, "types" => type_params}       
  def detach_answers_and_types_params
    if !params[:registration][:answers_attributes].blank? 
      
      # answers-attributes abloesen
      answers_params = params[:registration].delete(:answers_attributes)
      
      # type-attribute der answers rausloesen

      i=0
      a_params = {}
      type_params = {}
      
      answers_params.count.times do 
          # ganze answer herausloesen
        answer_i = answers_params.delete(i.to_s)
        if !answer_i[:type].blank?
            # type herausloesen
          type_i = answer_i.delete(:type).constantize.to_s
            # type zum type-hash 
          type_params.merge!(i.to_s => type_i)
        end
          # answer wieder zum answers-hash
        a_params.merge!(i.to_s => answer_i)
        i+=1
      end

      return {'answers' => a_params}.merge('types' => type_params)
    end
  end
  
  # count: anzahl der antworten
  # loest options aus params heraus, macht aus dem array einen einzigen string
  # und packt alle options zu einem einzigen hash zusammen
  # { position => options } für alle nichtleeren option-params
  # i stimmt mit der position ueberein
  def detach_options_params count
    if !params.blank?
      i=0
      options_params = {}
      count.times do
          opt_i = params.delete(i.to_s+'_options')
          if !opt_i.blank?
              # array to string mit .join
            opt_i = opt_i.join
            options_params.merge!(i.to_s+'_options' => opt_i)
          end  
          i+=1
      end
    end 
    return options_params
  end
  
  # fuegt die options zu ihren jeweiligen answers hinzu
  def match_answers_and_options answers_params, options_params
    i=0
    answers_params.count.times do
      if !options_params[i.to_s+'_options'].blank?
        answers_params[i.to_s].merge!('input' => options_params.delete(i.to_s+'_options'))
      end  
      i+=1
    end 
    return answers_params
  end
  
  # return true, falls die mitgegebene registration auf der warteliste ist, return false sonst
  def waitlist registration
    event = registration.event
    waitlist = false
      # registrations nach anmeldereihenfolge sortieren
    registrations = event.registrations.find(:all, :order => 'created_at') 
      # abfrage nur dann, wenn ueberhaupt eine obergrenze besteht
    if event.max_registration_count > -1
      i=0
      registrations.count.times do 
        if registrations[i] == registration && i>=event.max_registration_count
          waitlist = true
        end
        i+=1
      end
    end
    return waitlist
  end
end
