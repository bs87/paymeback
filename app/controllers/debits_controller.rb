class DebitsController < ApplicationController
   load_and_authorize_resource 

  # GET /debits
  # GET /debits.json
  def index
    @debits = Debit.where('emailcurrentuser like  ?', "#{current_user.email}")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @debits }
    end
  end

  # GET /debits/1
  # GET /debits/1.json
  def show
    @debit = Debit.find(:first, :conditions => ["emailcurrentuser = ? AND id = ?", "#{current_user.email}",params[:id] ], :limit => 1)
   
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


 friends = current_user.friends
   friends2 = current_user.inverse_friends 
   friendsall = friends + friends2
   @friend3 = friendsall
   @firstname = friendsall.map{|friend| "#{friend.user.email},<img src='#{current_user.photo.url(:tiny)}'/>"}
   #@firstname = User.find(:all,:select=>'firstname, lastname, email').map{|user| "#{user.firstname}, #{user.lastname}"}
  

  #@test = @nameall.find(:all,:select=>'firstname, lastname, email').map{|user| "#{user.firstname}, #{user.lastname}"}
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

    respond_to do |format|
      if @debit.save
        format.html { redirect_to @debit, notice: 'Debit was successfully created.' }
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
