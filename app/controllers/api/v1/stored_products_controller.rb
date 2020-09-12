# frozen_string_literal: true

class Api::V1::StoredProductsController < ShopifyApp::AuthenticatedController
  before_action :set_stored_product, only: %i[edit update destroy]

  def edit
    if @stored_product.shop_id == @shop.id
      @product_images = @stored_product.product_images
    else
      redirect_to root_path
    end
  end

  def update
    respond_to do |format|
      if @stored_product.update(stored_product_params)
        format.html { redirect_to @stored_product, notice: 'Stored product was successfully updated.' }
        format.json { render :show, status: :ok, location: @stored_product }
      else
        format.html { render :edit }
        format.json { render json: @stored_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stored_product.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_stored_products_url, notice: 'Stored product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_stored_product
    @stored_product = StoredProduct.find(params[:id])
  end

  def stored_product_params
    params.fetch(:stored_product, {})
  end
end
