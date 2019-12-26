class SessionController < ApplicationController
	def create
		@user = User.from_omniauth(request.env['omniauth.auth'])
		session[:user_id] = @user.id
		if @user != nil
			flash[:success] = "Добро пожаловать на сервис, #{@user.first_name}!"
			redirect_to view_path
		else
			flash[:warning] = "Упс, не удалось войти :("
		end
	end

	def destroy
    	session.delete(:user_id)
    	@current_user = nil
    	redirect_to root_path
    end
end
