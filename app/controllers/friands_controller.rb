class FriandsController < ApplicationController
  before_action :set_friand, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :correct_user, only:[:edit, :update, :destroy]
  # GET /friands or /friands.json
  def index
    @friands = Friand.all
  end

  # GET /friands/1 or /friands/1.json
  def show
  end

  # GET /friands/new
  def new
    #@friand = Friand.new
    @friand = current_user.friands.build
  end

  # GET /friands/1/edit
  def edit
  end

  # POST /friands or /friands.json
  def create
    #@friand = Friand.new(friand_params)
@friand = current_user.friands.build(friand_params)
    respond_to do |format|
      if @friand.save
        format.html { redirect_to @friand, notice: "Friand was successfully created." }
        format.json { render :show, status: :created, location: @friand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friands/1 or /friands/1.json
  def update
    respond_to do |format|
      if @friand.update(friand_params)
        format.html { redirect_to @friand, notice: "Friand was successfully updated." }
        format.json { render :show, status: :ok, location: @friand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friands/1 or /friands/1.json
  def destroy
    @friand.destroy
    respond_to do |format|
      format.html { redirect_to friands_url, notice: "Friand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def correct_user
  @friand = current_user.friands.find_by(id: params[:id] )
redirect_to friands_path, notice:" wrong" if@friand.nil?

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friand
      @friand = Friand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friand_params
      params.require(:friand).permit(:first_name, :last_name, :email, :phone, :facebook, :user_id)
    end
end
