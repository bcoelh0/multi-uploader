class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    #@images = Image.where(:user_id => 1)
  end

  # GET /images/new
  def new 
    @blogs = User.find(session[:user_id]).blogs.split(',')
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    #debugger
    blog = blog_params[:name]
    @user = User.find(session[:user_id])

    params[:image][:attached_assets_attrs].each do |item|
      ImgGroup.post item[:asset], @user, blog
    end

    respond_to do |format|
      format.html { render action: 'done' }
      format.json { render text: 'All posted.', status: :created, location: @image }
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  def done
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit!
    end

    def blog_params
      params.require(:blog).permit(:name)
    end
end
