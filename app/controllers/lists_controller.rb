class ListsController < ApplicationController
  def new
    @list=List.new
  end

  def create
    list = List.new(list_params)
    list.save
    # redirect_to '/top' を削除して、以下コードに変更
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)  
  end
  
  def index
     @lists = List.all #レコードを複数取得するので複数形のlists
  end

  def show
    @list = List.find(params[:id])  #レコードを一つだけ取得するので単数系のlist
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
 private
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
