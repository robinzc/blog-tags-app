class Api::PostsController < ApplicationController

  def index
    @posts = Post.all
    render "index.json.jb"

    if params[:tag]
      tag = Tag.find_by(tag: params[:tag])
      @posts = tag.posts
    end
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    render "show.json.jb"
  end

  def create
    @post = Post.new(
      title: params[:title],
      text: params[:text]
    )
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.title = params[:title] || @post.title
    @post.text = params[:text] || @post.text

    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: {message: "Post successfully destroyed!"}    
  end

end
