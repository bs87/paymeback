class StartsiteController < ApplicationController
  	 

  
def startsite
	if current_user
		debitfriends = current_user.friends.where(accepted: true)
    	debitfriends2 = current_user.inverse_friends.where(accepted: true)
    	@debitfriendsall = debitfriends + debitfriends2
    	@debits = Debit.where(emailcurrentuser: current_user.email)
	   	respond_to do |format|
      	format.html # index.html.erb
    	format.json { render json: @debits }	
    	end
	end
  end
end
