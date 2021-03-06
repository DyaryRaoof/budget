class SpendingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spending, only: %i[show edit update destroy]

  # GET /spendings or /spendings.json
  def index
    @spendings = Spending.joins(:group_spendings)
      .where(group_spendings: { group_id: params[:group_id] }).order(created_at: :desc)
    @group = Group.find(params[:group_id])
  end

  # GET /spendings/1 or /spendings/1.json
  def show; end

  # GET /spendings/new
  def new
    @spending = Spending.new
  end

  # GET /spendings/1/edit
  def edit; end

  # POST /spendings or /spendings.json
  def create
    @spending = Spending.new(author_id: spending_params[:author_id], name: spending_params[:name],
                             amount: spending_params[:amount])

    unless params[:spending][:group_ids]
      flash[:notice] = 'You should select at least one category'
      redirect_to request.referrer
      return
    end

    respond_to do |format|
      if @spending.save

        params[:spending][:group_ids].each do |group_id|
          puts group_id
          GroupSpending.create!(group_id: group_id.to_i, spending_id: @spending.id)
        end

        format.html { redirect_to group_spendings_url, notice: 'Spending was successfully created.' }
        format.json { render :show, status: :created, location: @spending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spendings/1 or /spendings/1.json
  def update
    respond_to do |format|
      if @spending.update(spending_params)
        format.html { redirect_to spending_url(@spending), notice: 'Spending was successfully updated.' }
        format.json { render :show, status: :ok, location: @spending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spendings/1 or /spendings/1.json
  def destroy
    @spending.destroy

    respond_to do |format|
      format.html { redirect_to spendings_url, notice: 'Spending was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spending
    @spending = Spending.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spending_params
    params.require(:spending).permit(:author_id, :name, :amount, group_ids: [])
  end
end
