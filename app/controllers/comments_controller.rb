class CommentsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comment = @post.comments.build
        else
            flash[:message] = "You can't comment on a post that does not exist!"
           redirect_to posts_path
        end 
    end 

    def create
        @post = Post.find_by_id(params[:post_id]) #make into helper method
        @comment = current_user.comments.build(comment_params)
        @comment.post = @post #assigning comment to specific post
        #byebug
        if @comment.save
            redirect_to posts_path
        else
          render :new  
        end
    end 

    def index
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comments = @post.comments 
        else @error = "That post does not exist" if params[:post_id]
            @comments = Comment.all
        end
    end

    def show
        @comment = Comment.find_by_id(params[:id])
        redirect_to post_comment_path
    end 

    def edit 
        @comment = Comment.find_by_id(params[:id])
        redirect_to post_comment_path if !@comment || @comment.user != current_user
    end 

    def update
        @comment = Comment.find_by_id(params[:id])
        redirect_to post_comment_path if !@comment || @comment.user != current_user
        if @comment.update(comment_params)
            redirect_to post_comment_path(@comment)
        else
            render :edit
        end
    end 

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end 

end


