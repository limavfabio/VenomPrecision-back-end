class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = Reservation.where(user_id: params[:user_id])
    details = @reservations.map { |reservation| details_reservation(reservation) }

    render json: { status: 'success', reservations: details }
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
      render json: { status: 'success', message: 'Product reserved successfully',
                     details: details_reservation(@reservation) }, status: :created
    else
      render json: { status: 'error', message: 'There was an error to reserve the product', missing_params:,
                     errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation => e
    render json: { status: 'error', message: 'There are missings fields', missing_params:, errors: [e.message] },
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
    if @reservation.destroy
      render json: { status: 'success', message: 'The reservation has been deleted' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :city, :user_id, :product_id)
  end

  # Json to return as details to user
  def details_reservation(reservation)
    { date: reservation.date.to_s,
      user_name: reservation.user.username,
      city: reservation.city,
      product_name: reservation.product.name,
      reserver_at: reservation.created_at }
  end

  # Validate if there are missing params
  def missing_params
    required_params = %i[date city user_id product_id]
    required_params.reject { |param| params.key?(param) }
  end

  # Validate if there is an empty value
  def validate_required_params_present?
    required_params = %i[date city user_id product_id]
    missing_params = required_params.reject { |param| params[:reservation][param].present? }

    missing_params.each do |param|
      @reservation.errors.add(param, "can't be blank")
    end

    missing_params.empty?
  end
end
