require 'prefix_function'

class TransactionsController < ApplicationController
  before_action :authenticate_student!


  def new
    @transaction = Transaction.new
    if params.has_key?(:book_id)
      @book_name = params[:book_title]
      @transaction.book_id = params[:book_id]
    end
  end

  def create

    if current_student.transactions.create(transaction_params)
      redirect_to current_student, notice: 'Your books is now on sale'
    else
      render new, alert: 'Error creating book.'
    end
  end


  def search

    array = []
    Transaction.find_each do |t|
      curr_book = Book.find(t.book_id)
      score = kmp_search(curr_book.title, params[:search].to_s)
      if score > 1
        array.push({:transaction => t, :score => -score})
      end
    end
    res = array.sort_by do |item|
      item[:score]
    end
    search = []
    res.each do |el|
      search.push(el[:transaction])
    end
    logger.debug "#{params[:search].to_s}"
    if search
      @transactions = search
      render 'search'
    else
      redirect_to root_url, notice: "No results were found"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:price, :book_id)
  end
end
