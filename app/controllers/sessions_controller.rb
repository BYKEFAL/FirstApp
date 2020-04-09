class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
        # Осуществить вход пользователя и переадресовать на страницу профиля.
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        #remember user
        redirect_to user
        else
        #flash[:danger] = 'Invalid email/password combination' # Неправильно!
        flash.now[:danger] = 'Invalid email/password combination' #Правильно!
        render 'new'
        end
  end
    
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
