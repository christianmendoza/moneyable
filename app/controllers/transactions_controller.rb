class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_transaction, only: [:edit, :show, :update, :destroy]

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create safe_transaction

    if @transaction.save
      flash[:notice] = "Transaction added."
      redirect_to @transaction
    else
      render 'new'
    end
  end

  def show
    render
  end

  def edit
    render
  end

  private

  def find_transaction
    @transaction = Transaction.find params[:id]
  end

  def safe_transaction
    params.require(:transaction).permit(:date_of, :transaction_type, :description, :amount, :transaction_cleared, :notes, :account_id, :category_id)
  end
end
