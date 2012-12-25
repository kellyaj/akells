class PostsController < ApplicationController
  before_filter :admin_check, :only => [ :new, :update, :edit, :destroy ]

  def admin_check
    unless current_user && User.find(session[:user_id]).admin?
      redirect_to root_url, notice: "You don't have permission to do that."
    end
  end

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).page(params[:page]).per(10)
    else
      @posts = Post.order('created_at DESC').page(params[:page]).per(5)
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

 
  def edit
    @post = Post.find(params[:id])
  end

 
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

  
  end
end
