class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /blogs
  def index #returns all blogs 
    @blogs = Blog.all.reverse

    render json: @blogs
  end

  # GET /blogs/1
  def show #returs a particualr blog
    render json: @blog
  end

  # POST /blogs
  def create #creates a blog with the prams 
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update # updates a blog with the params 
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy # deletes a particular blog
    @blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog # find the information on the particualr blog we want to show/update/delete with the previously mentioned before action
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params # hold the parameters the blog can take in to build a new blog 
      params.require(:blog).permit(:title, :description)
    end
end
