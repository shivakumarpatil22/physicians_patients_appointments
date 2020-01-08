class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def show
  end

  def index
    @appointments = Appointment.all.paginate(page: params[:page],per_page: 10)
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  def create
    @appointment = Appointment.new(appointment_params)
    Rails.logger.info appointment_params.inspect
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:physician_id, :patient_id)
  end
end
