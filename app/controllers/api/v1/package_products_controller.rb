class Api::V1::PackageProductsController < ApplicationController
  before_action :set_package_product, only: %i[show update destroy]

  # GET /package_products
  def index
    @package_products = PackageProduct.all

    render json: @package_products
  end

  # GET /package_products/1
  def show
    render json: @package_product
  end

  # POST /package_products
  def create
    @package_product = PackageProduct.new(package_product_params)

    if @package_product.save
      render json: @package_product, status: :created, location: @package_product
    else
      render json: @package_product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /package_products/1
  def update
    if @package_product.update(package_product_params)
      render json: @package_product
    else
      render json: @package_product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /package_products/1
  def destroy
    @package_product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_package_product
    @package_product = PackageProduct.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def package_product_params
    params.require(:package_product).permit(:quantity, :product_id, :package_id)
  end
end
