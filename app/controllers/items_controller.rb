class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create

    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to root_path, notice: 'Your item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:task, :due_date, :is_complete)
  end
end
