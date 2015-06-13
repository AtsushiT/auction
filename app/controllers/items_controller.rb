class ItemsController < ApplicationController
  def show
   @item = Item.find(params[:id]) # idでデータベースを検索する
 end
end


