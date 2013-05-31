class EventsController < ApplicationController

  skip_before_filter :authorize
  skip_before_filter :authorize2
  
  def index
    @users = User.all
    if session[:user_id] == 1 # wenn superuser mit id=1 eingeloggt ist, zeige alle events
      @events = Event.order(:expiry)
      @user = User.find_by_id(1)
    else  # ansonsten zeige nur die events vom aktuell eingeloggten user
      @users.each do |user| 
        if user.id == session[:user_id] 
        @user = user
        @events = @user.events
        end 
      end
    end
    
    # update locked: falls anmeldeschluss vorbei, schliesse anmeldung
    if @events   
      @events.each do |event|
        event.update_attribute(:locked, true)  if event.expiry < Date.today 
      end
    end

  respond_to  do  |format|
      unless session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else
        format.html 
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    @questions = @event.update_positions
      # aktuelle anzahl fragen 
    @event.update_attributes(:questions_count => @questions.count)
      # falls anmeldeschluss vorbei: schliessen
    @event.update_attribute(:locked, true) if @event.expiry < Date.today      

    respond_to  do  |format|
      unless session[:user_id] == 1 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else
        format.html
      end
    end
  end

  def new
    @user = User.find(params[:user_id])
    @event = @user.events.new

    respond_to  do  |format|
      unless session[:user_id]
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else
        format.html 
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
    @user = @event.user
    
    respond_to do |format|
      unless session[:user_id] == 1 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }  
      else 
        format.html
      end
    end
  end

  def create
    @user = User.find(params[:user_id])     
    @event = @user.events.create(params[:event]) 
    
    respond_to do |format|
      if @event.save
        
        # Infomail mit Anmeldelink an event.user
        Notifier.event_created(@event).deliver
        
        format.html { redirect_to user_event_path(@user, @event), notice: 'Veranstaltung erstellt.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def create_double
    @user = User.find(params[:user_id]) 
    @pattern = Event.find(params[:event_id])
    @pattern_questions = @pattern.update_positions
    @event = Event.new
    
      # falls validierung schief geht nochmal die question_types vom pattern für duplicate
    @question_types = []
    
    @pattern_questions.each do |pq|
        @q = @event.questions.build(:question => pq.question, :position => pq.position, :option1 => pq.option1, :option2 => pq.option2, :options => pq.options)
        @question_types[pq.position] = pq.type
    end
    
      # parameter auseinanderpfluecken, damit create was damit anfangen kann
    detached_params = detach_questions_and_types_params
    questions_params = detached_params.delete('questions')
    type_params = detached_params.delete('types')
    
    # detach_params wieder zu event_params dazu
    if questions_params
      params[:event] = params[:event].merge("questions_attributes" => questions_params)
    end 
    
    @event = @user.events.create(params[:event]) 
    
    # question.type setzen
    questions = @event.questions 
    i=0
    questions.each do |q|
      q.type = type_params.delete(i.to_s)
      i+=1
    end 

    respond_to do |format|
      if @event.save
        
        # Infomail mit Anmeldelink an event.user
        Notifier.event_created(@event).deliver
        
        format.html { redirect_to user_event_path(@user, @event), notice: 'Veranstaltung erstellt.' }
      else
        format.html { render action: "duplicate" }
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    @user = @event.user

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to user_event_path(@user, @event), notice: 'Aenderungen eingetragen.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  # schliessen/oeffnen eines events zur anmeldung
  def invert_locked
    @event = Event.find(params[:event_id])
    @user = @event.user_id 
    
    if @event.locked
      @event.update_attributes(:locked => false)
    else
      @event.update_attributes(:locked => true)
    end

    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event) }
      format.js
    end
  end
  
  # questions/q_table neu rendern 
  def refresh_questions
    @event = Event.find(params[:event_id])
    @questions = @event.questions.all(:order => 'position')
    
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @event = Event.find(params[:id])
      # id zum tabellen-update speichern und uebergeben
    @id = @event.id
    @user = @event.user_id 
    @event.destroy
    
    respond_to do |format|
      unless session[:user_id] == 1 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }  
      else 
        format.html { redirect_to users_path, notice: 'Veranstaltung geloescht.' }
        format.js   
      end
    end
  end
  
  # um ein event mit allen questions zu kopieren
  # @pattern ist das zu clonende event, @event das neue zu erstellende
  def duplicate 
    @pattern = Event.find(params[:event_id])
    @pattern_questions = @pattern.update_positions
    
    @user = User.find_by_id(session[:user_id])
    @event = Event.new
    
    # question-types muessen uebergeben werden, damit spaeter die richtigen kopien erstellt werden koennen
    @question_types = []
    
    @pattern_questions.each do |pq|
        @q = @event.questions.build(:question => pq.question, :position => pq.position, :option1 => pq.option1, :option2 => pq.option2, :options => pq.options)
        @question_types[pq.position] = pq.type
    end

    respond_to do |format|
      format.html
    end
  end
  
    private
  
  # questions und types aus params entfernen
  # questions_params: alle attribute ohne :type, {"0" => {...}, "1" => {...}, ...}
  # type_params: alle antwort-typen, {"0" => {:type => TextAnswer}, "1" => {:type => ...}, ...}
  # returns: {"questions" => questions_params, "types" => type_params}       
  def detach_questions_and_types_params
    if !params[:event][:questions_attributes].blank? 
      
      # answers-attributes ablösen
      questions_params = params[:event].delete(:questions_attributes)
      
      # type-attribute der questions rauslösen

      i=0
      q_params = {}
      type_params = {}
      
      questions_params.count.times do 
        question_i = questions_params.delete(i.to_s)
        if !question_i[:type].blank?
          type_i = question_i.delete(:type).constantize.to_s
          type_params.merge!(i.to_s => type_i)
        end
        ##
        q_params.merge!(i.to_s => question_i)
        i+=1
      end

      return {'questions' => q_params}.merge('types' => type_params)
    end
  end
end
