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
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    if @bookmark.destroy
      flash[:success] = 'Bookmark was successfully deleted.'
      redirect_to list_path(@list)
    else
      flash[:error] = 'Something went wrong'
      redirect_to list_path(@list)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
