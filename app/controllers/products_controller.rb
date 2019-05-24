class ProductsController < ApplicationController
    def index
        products = Product.all
        render json: {data: products}, status: 200

    end

    def show
        product = Product.find_by(id: params[:id])
        render json: {data: product}, status: 200
    end

    def create
        product = Product.new(product_params)
        product.image = encode_image()
        if product.save
            render json: {data: product}, status: 200
        end
    end

    def update
        product = Product.find_by(id: params[:id])
        product.update(product_params)
        if params[:image] 
            product.image = encode_image()
        end
        if product.save
            render json: {data: product}, status: 200
        end
    end

    def destroy
        Product.find_by(id: params[:id]).destroy
        render json: {data: "Product deleted"}, status: 200
    end


    private

    def product_params
        params.permit(:name, :description, :price, :size, :stock, :times_purchased)
    end


end