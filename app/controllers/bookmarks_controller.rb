class BookmarksController < ApplicationController
  before_action :set_restaurant, only: %i[new create show]
  # def index
  #   @bookmarks = Bookmark.all
  # end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # def destroy
  #   @bookmark = Bookmark.find(params[:id])
  #   # @bookmark.list = @list
  #   @bookmark.destroy
  #   redirect_to list_path(@bookmark.list), status: :see_other
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_restaurant
    @list = List.find(params[:list_id])
  end
end
