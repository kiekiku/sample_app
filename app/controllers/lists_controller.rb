class ListsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    list=List.new(list_params)
    list.save
    redirect_to'/top'
  end
  
  def index
    @lists = List.all #レコードを複数取得するので複数形のlists
  end

  def show
    @list = List.find(params[:id]) #レコードを一つだけ取得するので単数系のlist
  end

  def edit
  end
  
 private
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
