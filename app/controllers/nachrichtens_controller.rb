class NachrichtensController < ApplicationController
  # GET /nachrichtens
  # GET /nachrichtens.json
  def index
    @nachrichtens = Nachrichten.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nachrichtens }
    end
  end

  # GET /nachrichtens/1
  # GET /nachrichtens/1.json
  def show
    @nachrichten = Nachrichten.where(sentby: current_user.id, id: params[:id]).first
    if @nachrichten ==nil
      @nachrichten = Nachrichten.where(sentto: current_user.id, id: params[:id]).first
      if @nachrichten==nil
        flash[:error] ="Zugriff verweigert."
        redirect_to root_url
      end 
    end
    if @nachrichten ==nil
    else
    if @nachrichten.read == false
      if @nachrichten.sentto == current_user.id       
      @nachrichten.read = true
      respond_to do |format|
      if @nachrichten.update_attributes(params[:read => true])
        format.html # show.html.erb
        format.json { render json: @nachrichten }
      else
        flash[:error] ="Ein Fehler ist aufgetreten."
        redirect_to root_url
      end
    end
    end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @nachrichten }
      end
    end
  end
  end
  # GET /nachrichtens/new
  # GET /nachrichtens/new.json
  def new
    @nachrichten = Nachrichten.new
    @sentto = params[:sentto]
    @topic = params[:topic]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nachrichten }
    end
  end
  # GET /nachrichtens/1/edit
  def edit
    @nachrichten = Nachrichten.find(params[:id])
    @sentto = @nachrichten.sentby
    @topic = "re:"+@nachrichten.topic
    @nachrichtens = Nachrichten.new
        redirect_to new_nachrichten_path(:sentto => @sentto, :topic => @topic), :method => :get
  end

  # POST /nachrichtens
  # POST /nachrichtens.json
  def create
    @nachricht = Nachrichten.new(params[:nachrichten])
    #(:sentby => params[:sentby],:sentto =>params[:sentto],:topic => params[:topic],:body =>params[:body])
    #respond_to do |format|
      if @nachricht.save
        flash[:notice] ="Nachricht verschickt."
        redirect_to root_url
      else
        flash[:error] ="Nachricht konnte nicht verschickt werden."
        redirect_to root_url
      end
    #end
    
  end

  def answer
    @nachrichten = Nachrichten.find(params[:id])
    @sentto = @nachrichten.sentby
    @sentby = @nachrichten.sentto
    @topic = "re:"+@nachrichten.topic
    @nachrichtens = Nachrichten.new(params[:sentto => :@sentto], params[:sentby => :@sentto], params[:topic => :@topic])
    
    if @nachricht.save
        flash[:notice] ="Antwort verschickt."
        redirect_to root_url
      else
        flash[:error] ="Antwort konnte nicht verschickt werden."
        redirect_to root_url
      end
  end

  # PUT /nachrichtens/1
  # PUT /nachrichtens/1.json
  def update
    @nachrichten = Nachrichten.find(params[:id])
    respond_to do |format|
        @nachrichten.read = true
        @nachrichten.save
        format.html { redirect_to nachrichten, notice: 'Nachrichten was successfully updated.' }
        format.json { head :no_content }
      end
  end


  # DELETE /nachrichtens/1
  # DELETE /nachrichtens/1.json
  def destroy
    @nachrichten = Nachrichten.find(params[:id])
    @nachrichten.destroy

    respond_to do |format|
      format.html { redirect_to nachrichtens_url }
      format.json { head :no_content }
    end
  end
end
