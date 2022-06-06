class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hi! It's so good to see you again"
        redirect_to "/places"
      else
        flash["notice"] = "Nope"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "See you later, Aligator"
    redirect_to "/login"
  end
end
  