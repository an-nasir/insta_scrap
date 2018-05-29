class WebSettingsController < ApplicationController
  before_action :set_web_setting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /web_settings
  # GET /web_settings.json
  def index
    @web_settings = WebSetting.all
  end

  # GET /web_settings/1
  # GET /web_settings/1.json
  def show
  end

  # GET /web_settings/new
  def new
    @web_setting = WebSetting.all.count > 0 ? WebSetting.first : WebSetting.new
  end

  # GET /web_settings/1/edit
  def edit
  end

  # POST /web_settings
  # POST /web_settings.json
  def create
    @web_setting = WebSetting.all.count > 0 ? @web_setting.update(web_setting_params) : WebSetting.new(web_setting_params)

    respond_to do |format|
      if @web_setting.save
        format.html { redirect_to @web_setting, notice: 'Web setting was successfully created.' }
        format.json { redirect_to root_url, status: :created, location: @web_setting }
      else
        format.html { render :new }
        format.json { render json: @web_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_settings/1
  # PATCH/PUT /web_settings/1.json
  def update
    respond_to do |format|
      if @web_setting.update(web_setting_params)
        format.html { redirect_to root_url, notice: 'Web setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_setting }
      else
        format.html { render :edit }
        format.json { render json: @web_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_settings/1
  # DELETE /web_settings/1.json
  def destroy
    @web_setting.destroy
    respond_to do |format|
      format.html { redirect_to web_settings_url, notice: 'Web setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_setting
      @web_setting = WebSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_setting_params
      params.require(:web_setting).permit(:post_min, :post_max)
    end
end
