class SessionsController < ApplicationController

    def home 
    end 

    def destroy
        binding.pry
    session.clear
    redirect_to root_path
    end 
end 