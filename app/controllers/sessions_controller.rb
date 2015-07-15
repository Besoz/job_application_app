class SessionsController < ApplicationController
	def new
		@title = "Sign in"
		render 'new'
	end
	def create
		user = Interviewer.authenticate(params[:session][:email],
		params[:session][:password])
		if user.nil?
			flash.now[:error] = "Invalid email/password combination."
			@title = "Sign in"
			render 'new'
		else
			# Sign the user in and redirect to the user's show page.
			sign_in user
			redirect_to user
		end
	end
	def destroy
	end
end