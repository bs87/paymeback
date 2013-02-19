class StartsiteController < ApplicationController
  	@current_user = curent_user
  	if @current_user

  	else
		def startsite
    	@debits = Debit.where('emailcurrentuser like  ?', "#{current_user.email}")
    	respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @debits }
    	end
    end
  end
end
