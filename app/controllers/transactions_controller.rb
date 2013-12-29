class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_transaction, only: [:edit, :show, :update, :destroy]

  def index
    @user = User.find(current_user)
    @account = @user.accounts.find(params[:account_id])
    @transactions = @account.transactions
  end

  def new
    @user = User.find(current_user)
    @account = @user.accounts.find(params[:account_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(safe_transaction)

    if @transaction.save
      flash[:notice] = "Transaction added."
      redirect_to @transaction
    else
      render 'new'
    end
  end

  def show
    @user = User.find(current_user)
    @account = @user.accounts.find(params[:id])
    @transactions = @account.transactions
  end

  def edit
    render
  end

  private

  def find_transaction
    # @user = User.find(current_user)
    # @account = @user.accounts.find(params[:id])
    @transaction = Transaction.find params[:id]
  end

  def safe_transaction
    params.require(:transaction).permit(:date_of, :transaction_type, :description, :amount, :transaction_cleared, :notes, :account_id, :category_id)
  end
end
