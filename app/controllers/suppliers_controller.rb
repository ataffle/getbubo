class SuppliersController < ApplicationController
  before_action :set_suppliers, only: [:index, :create]

  def index
    @supplier = Supplier.new
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.organization = current_user.organization
    if @supplier.save
      redirect_to suppliers_path
    else
      render :index
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_params)
    redirect_to suppliers_path
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
  end

  private

  def set_suppliers
    @suppliers = Supplier.all
  end

  def supplier_params
    params.require(:supplier).permit(:name, :organization_id)
  end
end
