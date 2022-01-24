class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    authorize(@bookmark)

    if @bookmark.save
      redirect_to list_path(@list), notice: "Movie added to list!"
    else
      render 'lists/show'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
