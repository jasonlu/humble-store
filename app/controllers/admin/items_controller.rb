class Admin::ItemsController < Admin::BackstageController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    #@item = Item.new
  end

  def upload_cover_image

    #if request.post?
    filepath = ''
    fileurl = ''
    params[:files].each do |file|
      uploaded_io = file
      year_and_month = Time.now.year.to_s + '_' + Time.now.month.to_s
      filebase_dir = 'public/images/items/' + year_and_month
      filebase_dir_full = Rails.root.join(filebase_dir);

      if !File.directory? filebase_dir_full
        FileUtils.mkdir_p filebase_dir_full
      end
      
      ext = File.extname uploaded_io.original_filename
      basename = File.basename uploaded_io.original_filename, ".*"
      rnd_str = (0...8).map { (65 + rand(26)).chr }.join.downcase
      filename = basename + '_' + rnd_str + ext
      filepath = filebase_dir + '/' + filename
      filepath_full = filebase_dir_full.to_s + '/' + filename
      fileurl = filepath.sub /^public/, ''
      File.open(filepath_full, 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
    render json: {:filepath => fileurl}
    #else
  end


  def new_form
    @item = Item.new
    category_id = params[:category_id]
    @item.category_id = category_id
    #@item.category = Category.find(category_id)
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:category_id, :title, :cover_image, :description, :briefing, :price, :stock)
    end
end
