class SuppliersController < ApplicationController
  before_action :set_suppliers, only: [:index, :create]

  def index
    @suppliers = policy_scope(Supplier)
    authorize @suppliers
  end

  def show
    @supplier = Supplier.find(params[:id])
    @commitments_by_supplier = @supplier.commitments
    authorize @supplier
  end

  def new
    @supplier = Supplier.new
    authorize @supplier
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.organization = current_user.organization
    authorize @supplier
    if @supplier.save
      redirect_to new_commitment_path
    else
      render "commitments/new"
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    authorize @supplier
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_params)
    authorize @supplier
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
