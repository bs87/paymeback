class DebitsController < ApplicationController
   load_and_authorize_resource 
   autocomplete :debit, :emailcurrentuser

  # GET /debits
  # GET /debits.json
 
  def index

    if params[:user].present?
      @debits = Debit.where(emailcurrentuser: current_user.email , emailuser2: params[:user])
      @debits = @debits.find(:all, :select => "*, helper as usersum")
   else
        if params[:art] == "history"
          @debits = Debit.where(emailcurrentuser: current_user.email)
        else
          @debits = Debit.where(emailcurrentuser: current_user.email, gezahlt: false).group("emailuser2").sum("betrag")
    
#@debits = Debit.where(emailcurrentuser: current_user.email , gezahlt: false )
    #@debits = @debits.find(:all, :select => "*, SUM(betrag) as usersum", :group => 'emailuser2')
   # @hours = Debit.group_by { |h| h.emailuser2 }
     #@debits.find(:all, :select => "distinct (emailuser2),*, id,SUM(betrag) as usersum")
      #@debits = @debits.select("DISTINCT ON (debits.emailuser2) * ").group("id, emailcurrentuser,emailuser2 ,betrag, datum,info, gezahlt,created_at, updated_at, firstname, lastname,art,helper")
  
      end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @debits }
    end
  end

  # GET /debits/1
  # GET /debits/1.json
  def show
    @debit = Debit.find(:first, :conditions => [emailcurrentuser: current_user.email , id: params[:id] ], :limit => 1)
   
    if @debit == nil
    flash[:error] = "Zugriff Verweigert!  "
    redirect_to debits_path
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @debit }
    end
    end
  end

  # GET /debits/new
  # GET /debits/new.json
  def new
   @debit = Debit.new



   friends = current_user.friends.where(accepted: true)
   friends2 = current_user.inverse_friends.where(accepted: true)
   friendsall = friends + friends2
   @friend3 = friendsall
   @Fullname = Hash.new

   @Fullname = friendsall.map{|friend| {'label' => "#{friend.user.firstname} #{friend.user.lastname}", 'email' => "#{friend.user.email}", 'icon' => "<img src='#{friend.user.photo.url(:tiny)}'/>"}}
   

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @debit }
    end
  end

  # GET /debits/1/edit
  def edit
    @debit = Debit.find(params[:id])
  end

  # POST /debits
  # POST /debits.json
  def create
    @debit = Debit.new(params[:debit]) 
    if @debit.art == 'Geliehen'
        @art = 'Verliehen'
        @betrag = @debit.betrag
        @debit.betrag=@debit.betrag*-1
    else
      @art= 'Geliehen'
      @betrag = @debit.betrag*-1
    end

    Debit.transaction do
      Debit.create(:emailcurrentuser => @debit.emailuser2, :emailuser2 => @debit.emailcurrentuser, :betrag => @betrag, :art => @art, :info => @debit.info, :datum => @debit.datum, :gezahlt => @debit.gezahlt)
  end
    respond_to do |format|
      if @debit.save
        format.html { redirect_to debits_path, notice: 'Debit was successfully created.' }
        format.json { render json: @debit, status: :created, location: @debit }
      else
        format.html { render action: "new" }
        format.json { render json: @debit.errors, status: :unprocessable_entity }
      end
    end
   
  end

  # PUT /debits/1
  # PUT /debits/1.json
  def update
    @debit = Debit.find(params[:id])

    respond_to do |format|
      if @debit.update_attributes(params[:debit])
        format.html { redirect_to @debit, notice: 'Debit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @debit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debits/1
  # DELETE /debits/1.json
  def destroy
    @debit = Debit.find(params[:id])
    @debit.destroy

    respond_to do |format|
      format.html { redirect_to debits_url }
      format.json { head :no_content }
    end
  end
end
