class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.all
    details = @products.map { |product| details_product(product) }

    render json: { status: 'success', products: details }
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.valid? && validate_required_params_present?
      @product.save
      render json: { status: 'success', message: 'Product created successfully',
                     details: details_product(@product) }, status: :created
    else
      render json: { status: 'error', message: 'There was an error to create the product', missing_params:,
                     errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::NotNullViolation => e
    render json: { status: 'error', message: 'There are missings fields', missing_params:, errors: [e.message] },
           status: :unprocessable_entity
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    if params[:user_id] == @product.owner_id
      @product.destroy
      render json: { status: 'success', message: 'The product was deleted successfully' }
    else
      render json: { status: 'error', message: 'The user who requested to delete is not the owner' },
             status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :image, :price, :owner_id)
  end

  # Validate if there are missing params
  def missing_params
    required_params = %i[name description image price owner_id]
    required_params.reject { |param| params.key?(param) }
  end

  def validate_required_params_present?
    required_params = %i[name description image price owner_id]
    missing_params = required_params.reject { |param| params[:product][param].present? }

    missing_params.each do |param|
      @product.errors.add(param, "can't be blank")
    end

    missing_params.empty?
  end

  # Json to return as details to user
  def details_product(product)
    { id: product.id,
      name: product.name.capitalize,
      description: product.description,
      owner_id: product.owner_id,
      image: product.image,
      price: product.price }
  end
end
