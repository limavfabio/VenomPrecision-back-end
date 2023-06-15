class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.valid? && validate_required_params_present?
      @reservation.save
      render json: { status: 'success', message: 'Package reserved successfully',
                     details: details_reservation(@reservation) }, status: :created
    else
      render json: { status: 'error', message: 'There was an error to reserve the package', missing_params:,
                     errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation => e
    render json: { status: 'error', message: 'Faltan campos obligatorios', missing_params:, errors: [e.message] },
           status: :unprocessable_entity
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :start_time, :end_time, :user_id, :package_id)
  end

  # Json to return as details to user
  def details_reservation(reservation)
    { date: reservation.date.to_s,
      start_time: reservation.start_time.strftime('%H:%M'),
      end_time: reservation.end_time.strftime('%H:%M'),
      user_name: reservation.user.name,
      package_name: reservation.package.name,
      created_at: reservation.created_at,
      updated_at: reservation.updated_at }
  end

  # Validate if there are missing params
  def missing_params
    required_params = %i[date start_time end_time user_id package_id]
    required_params.reject { |param| params.key?(param) }
  end

  # Validate if there is an empty value
  def validate_required_params_present?
    required_params = %i[date start_time end_time user_id package_id]
    missing_params = required_params.reject { |param| params[param].present? }

    missing_params.each do |param|
      @reservation.errors.add(param, "can't be blank")
    end

    missing_params.empty?
  end
end
