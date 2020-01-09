class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]
  def new
    @physician = Physician.new
  end

  def edit
  end

  def show
  end

  def index
    @physicians = Physician.all.paginate(page: params[:page],per_page: 10)
  end

  def destroy
    @physician.destroy
    redirect_to physicians_path
  end

  def create
    @physician = Physician.new(physician_params)

    respond_to do |format|
      if @physician.save
        format.html { redirect_to @physician, notice: 'physician was successfully created.' }
        format.json { render :show, status: :created, location: @physician }
      else
        format.html { render :new }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to @physician, notice: 'physician was successfully updated.' }
        format.json { render :show, status: :ok, location: @physician }
      else
        format.html { render :edit }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_physician
    @physician = Physician.find(params[:id])
  end

  def physician_params
    params.require(:physician).permit(:name, :physician_id)
  end
end
