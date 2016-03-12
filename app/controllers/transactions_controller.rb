class TransactionsController < ApplicationController
  before_action :authenticate_student!

  def new
    @transaction = transaction.new
  end
  def create
    if current_student.transactions.create(transaction_params)
      redirect_to @student, notice: 'Your books is now on sale'
    else
      render new, alert: 'Error creating book.'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:price, :book_id)
  end
end
