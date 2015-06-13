class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
   @item = Item.find(params[:id]) # idでデータベースを検索する
  end

  def new
    @item = Item.new
  end

  def edit
    # http://localhost:3000/items/5/edit
    # 上のURLの5を取得して、@item = Item.find(5)
    @item = Item.find(params[:id])
  end

  def create
    # フォームから投げられたオブジェクトを格納する
    # item_paramsの定義は下部に記載
    # params[:item] とかだったかな…
    @item = Item.new(item_params)

    # これを保存する
    @item.save

    # show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  def update
    # フォームから送られたオブジェクトを更新する
    @item = Item.find(params[:id])
    # update_attributesメソッドで上書き保存する
    @item.update_attributes(item_params)
    # show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  private

  def item_params
    # params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :seller_id,
      :email,
      :image_url
       )
  end
end


