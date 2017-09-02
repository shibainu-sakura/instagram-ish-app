class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,
 # 3/15 8----
  :toggle_like
# ----
]
# 3/15 10
  before_action :set_current_user, only: [:toggle_follow, :toggle_like, :create]


  def toggle_follow
    # 3/15 11 change  current_user => @user
   @user.toggle_follow!(User.find(params[:user_id]))
   redirect_to :back
#render :show
  end

# 3/15 8----
 def toggle_like
   @user.toggle_like!(@post)
   redirect_to :back
 end
 # ----

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     # 3/15 2 ----
    @number = "12"
    #ternary
    @follow_status = current_user.follows?(@post.user) ? 'Unfollow' : 'Follow'
    #  ----
    # 3/15 13
    @like_status = current_user.likes?(@post) ? 'Unlike' : 'Like'
    #  ----
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    # 14/03 3
    # 3/15 11 change  current_user => @user
    @post.user_id = @user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @taka = "Taka!!!!"

    end

# 3/15 9
    def set_currrent_user
      @user = current_user
    end
# ----

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :user_id, :post_image, :post_image_cache)
    end
end
