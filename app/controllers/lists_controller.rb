class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    puts "CREATE ACTiON"
    if @list.save
      puts "SAVING LIST #{@list.inspect}"
      flash[:success] = "List successfully created"
      redirect_to list_path(@list)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
