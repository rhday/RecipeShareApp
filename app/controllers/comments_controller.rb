class CommentsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        @comment = Comment.new
    end 

    def create
        @comment = 
    end 

    def index
    end

    def show
    end 

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end 

end


