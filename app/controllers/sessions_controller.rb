class SessionsController < ApplicationController
	def new
		@title = "Sign in"
		render 'new'
	end
	def create
		interviewer = Interviewer.authenticate(params[:session][:email],
		params[:session][:password])
		if interviewer.nil?
			flash.now[:error] = "Invalid email/password combination."
			@title = "Sign in"
			render 'new'
		else
			# Sign the user in and redirect to the user's show page.
			sign_in interviewer
			redirect_to interviewer
		end
	end
	def destroy
	end
end