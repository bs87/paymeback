class StartsiteController < ApplicationController
  	 

  
def startsite
	if current_user
    	@debits = Debit.where('emailcurrentuser like  ?', "#{current_user.email}")
	   	respond_to do |format|
      	format.html # index.html.erb
    	format.json { render json: @debits }	
    	end
	end
  end
end
