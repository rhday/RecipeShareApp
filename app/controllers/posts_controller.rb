class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

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
        @post = Post.find_by_id(params[:id])
        redirect_to posts_path if !@post
    end
    
    def edit
        @post = Post.find_by_id(params[:id])
        redirect_to posts_path if !@post || @post.user != current_user
    end 

    def update 
        @post = Post.find_by_id(params[:id])
        redirect_to posts_path if !@post || @post.user != current_user
        if @post.update(post_params)
            redirect_to posts_path(@post)
        else
            render :edit
        end
    end 

    def delete
        @post = Post.find_by_id(params[:id])
        @post.destroy
        redirect_to posts_path
    end 

    private

    def post_params
        params.require(:post).permit(:title, :content, :category_id)
    end 
end
