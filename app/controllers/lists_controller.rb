class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create

    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: 'Your list was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:name)
  end
end
