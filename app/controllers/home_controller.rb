class HomeController < ApplicationController
    before_action :set_post, only: [ :edit,:update,:destroy]
    
    def house
      
    end
    def gongji
    end
    
    def gongjiindex
      @post = Post.all
    end
    def gongjicreate
      @post = Post.new
      @post.title = params[:title]
      @post.content = params[:content]
      @post.save
      # redirect_to "/home/gongjishow/#{@post.id}"
      redirect_to "/home/gongjiindex"
    end
    
    def gongjishow
      @post = Post.find(params[:post_id])
    end
    
    def gongjiedit
      @post = Post.find(params[:post_id])
    end
    
    def gongjiupdate
      @post = Post.find(params[:post_id])
      @post.title = params[:title]
      @post.content = params[:content]
      @post.save
      redirect_to root_path
    end
    def gongjidestroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to "/home/gongjidex"
    end
    
    def index
     @title =  Post.pluck(:title)
    end
    
    def new
      @post = Post.new
    end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
   @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content)
  end
  
  def clean
  end
  
  def wash #빨래당번
  end
  
  def birthday
  end
end

