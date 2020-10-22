class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_post, only: [:show, :edit, :update, :delete] #in each of these actions the post will be automaticaly found.
    

    def new 
        @post = Post.new
    end 

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end 

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @posts = @user.posts.alpha
        else
            flash[:message] = "That post does not exist" if params[:user_id]
            @posts = Post.alpha
        end
    end 

    def show 
        redirect_to posts_path if !@post
    end
    
    def edit
        redirect_to posts_path if !@post || @post.user != current_user
    end 

    def update 
        redirect_to posts_path if !@post || @post.user != current_user
        if @post.update(post_params)
            redirect_to posts_path(@post)
        else
            render :edit
        end
    end 

    def delete
        @post.destroy
        redirect_to posts_path
    end 

    private

    def find_post
        @post = Post.find_by_id(params[:id])
    end 

    def post_params
        params.require(:post).permit(:title, :content, :category_id)
    end 
end
