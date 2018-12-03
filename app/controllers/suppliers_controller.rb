class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to suplier_path(@suplier)
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_params)
    redirect_to supplier_path(@supplier)
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end
end
