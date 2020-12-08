class CommentsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :find_comment, only: [:show, :edit, :update, :destroy] #in each of these actions the comment in question will be automaticaly found.
    before_action :find_post, only: [:create, :edit, :update]

    def new
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comment = @post.comments.build
        else
            flash[:message] = "You can't comment on a post that does not exist!"
           redirect_to user_posts_path(current_user)
        end 
    end 

    def create
        @post = Post.find_by_id(params[:post_id]) #make into helper method
        @comment = current_user.comments.build(comment_params)
        @comment.post = @post #assigning comment to specific post
        #byebug
        if @comment.save
            redirect_to user_posts_path(current_user)
        else
          render :new  
        end
    end 

    def index
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comments = @post.comments.alpha 
        else @error = "That post does not exist" if params[:post_id]
            @comments = Comment.all.alpha
        end
    end

    def edit
        #byebug
        redirect_to user_post_comments_path(@comment.post.user, @comment.post_id) if !@comment || @comment.user != current_user
    end

    def update
        #byebug
        #post = current_user.post
        redirect_to user_post_comments_path(@comment.post.user, @comment.post_id) if !@comment || @comment.user != current_user
    if @comment.update(comment_params)
        redirect_to user_post_comments_path(@comment.post.user, @comment.post_id)
    else
        render :edit
    end
    end 

    def destroy
        @comment.destroy
        redirect_to user_post_comments_path(@comment.post.user, @comment.post_id)
    end 
   

    private

    def find_post
        @post = Post.find_by_id(params[:post_id])
    end

    def find_comment
        @comment = Comment.find_by_id(params[:id])
    end 

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end 

end
