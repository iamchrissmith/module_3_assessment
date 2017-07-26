class Api::V1::ItemsController < ApiController

  before_action :set_item, only: [:show]

  def create
    item = Item.create(item_params)
    if item.save
      redirect_to api_v1_item_path(item)
    else
      render json: item.errors, status: 400
    end
  end

  def show

  end

  private
    def set_item
      @item = Item.find_by(id: params[:id])
    end

    def item_params
      params.require(:item).permit(:name,
                                   :description,
                                   :image_url)
    end
end
