class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @post = Post.new
    end 
end
