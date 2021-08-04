class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end
  
  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      flash[:success] = "Bookmark successfully created"
      redirect_to list_path(@bookmark.list)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
