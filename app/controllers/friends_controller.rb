class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.json
  #def index
  #  @friends = Friend.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @friends }
  #  end
  #end

  # GET /friends/1
  # GET /friends/1.json
  #def show
  #  @friend = current_user.friends.find(params[:id])

  # respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @friend }
  #  end
  #end

  # GET /friends/new
  # GET /friends/new.json
  #def new
  #  @friend = Friend.new

  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @friend }
  #  end
  #end

  # GET /friends/1/edit
  #def edit
  #  @friend = Friend.find(params[:id])
  #end

  # POST /friends
  # POST /friends.json
  def create
    
    #eventuell implementieren und zu verhindern, dass ein bereits hinzugefügter nutzer noch ein mal hinzugefügt wird.
    #
    #@exists = Friend.where('user_id like ? AND friend_id like ?', "%#{current_user.id}%", "%#{:friend_id}%" ).first
    #if @exists.user_id == current_user.id
    #    flash[:error] = "Hinzufuegen nicht moeglich."
    #    redirect_to friends_path
    #else
    #  @friend = current_user.friends.build(:friend_id => params[:friend_id])
    #  if @friend.save
    #    flash[:notice] = "Freund hinzugefuegt."
    #    redirect_to friends_path
    #  end
    #end
    #
    #

    #user = User.where('id like ?', "%#{:friend_id}%")
    @friend = current_user.friends.build(:friend_id => params[:user_id], :user_id => params[:friend_id])
    #@friend = user.friends.build(:friend_id => params[:current_user.id])
    
      if @friend.save
        flash[:notice] = "Freund hinzugefuegt."
        redirect_to friends_path
      else
        flash[:error] = "Hinzufuegen nicht moeglich."
        redirect_to friends_path
      end    
  end

  # PUT /friends/1
  # PUT /friends/1.json

  # Freundschaftsanfrage annehmen
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
        @friend.accepted = true
        @friend.save
        format.html { redirect_to friends_path, notice: 'Anfrage erfolgreich angenommen.' }
        format.json { head :no_content }
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json

  # Freundschaftsanfrage ablehnen
  def ablehnen
    @friend = current_user.friends.find(params[:id])
    @friend.destroy
    #@friend = Friend.find(:first, params[:id])
    #Friend.where('id like ? ', "%#{:id}%")
    #@friend.destroy
    flash[:notice] = "Anfrage abgelehnt."
    redirect_to friends_path
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    flash[:notice] = "Freundschaft beendet."

    redirect_to friends_path
    
  end

end