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
    end 

    def update 
        @post = Post.find_by_id(params[:id])
        @post.update(title: params[:post][:title], content: params[:post][:content])
        redirect_to posts_path(@post)
    end 

    private

    def post_params
        params.require(:post).permit(:title, :content, :category_id)
    end 
end
