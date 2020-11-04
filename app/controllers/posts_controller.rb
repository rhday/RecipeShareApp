class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_post, only: [:show, :edit, :update, :delete] #in each of these actions the post will be automaticaly found.
    

    def new 
        @post = Post.new
    end 

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to user_posts_path(current_user)
        else
            render :new
        end
    end 

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @posts = Post.all.most_comments
        else
            flash[:message] = "That post does not exist" if params[:user_id]
            @posts = Post.all.most_comments
        end
    end 

    def show 
        redirect_to user_posts_path(current_user) if !@post
    end
    
    def edit
        redirect_to user_posts_path(current_user) if !@post || @post.user != current_user
    end 

    def update 
        redirect_to user_posts_path(current_user) if !@post || @post.user != current_user
        if @post.update(post_params)
            redirect_to user_posts_path(current_user, @post)
        else
            render :edit
        end
    end 

    def delete
        @post.destroy
        redirect_to user_posts_path(current_user)
    end 

    private

    def find_post
        @post = Post.find_by_id(params[:id])
    end 

    def post_params
        params.require(:post).permit(:title, :content, :category_id)
    end 
end
