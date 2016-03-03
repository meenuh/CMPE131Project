require 'json'

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.paginate(:all, :order => 'created_at desc', :per_page => 25, :page => params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @student = current_student
    if current_student.books.create(book_params)
      redirect_to @student, notice: 'Book was succesfully created.'
    else
      redirect_to @book, alert: 'Error creating book.'
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
     logger.debug " AEEEEEEEEEEE #{params[:search].to_s}"
    #search = Book.find_by(title: params[:search].to_s)
    search = Book.where('title = ?', params[:search])
    logger.debug "#{params[:search].to_s}"
    if search
      @books = search
        logger.debug "VALOR DO BOOK MANO#{@books}"
      render 'search'
    else
      redirect_to root_url, notice: "No results were found"
    end

    # logger.debug "AEEE"
    # if request.post?
    #
    #   #pass the book into a get with the 'q' param
    #   redirect_to search_books_path(:q => params[:search][:query])
    #
    # elsif request.get?
    #
    #   unless params[:q].blank?
    #
    #     #Searchlogics title_like_all to search within titles in the Book model for any of the words in the query.
    #     #words in the string are split into an array by spaces
    #     search = Book.title_like_all(params[:q].to_s.split).descend_by_created_at
    #
    #     #paginate the results
    #     @books = search.paginate(:per_page => 25, :page => params[:page])
    #
    #     #pass the query object to the view to let the user know what they searched for
    #     @query = params[:q]
    #
    #   end
    #
    #   #render the Book index.html.erb
    #   render 'index'
    #
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
