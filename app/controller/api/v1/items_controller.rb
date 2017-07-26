class Api::V1::ItemsController < ApiController

  before_action :set_item, only: [:show]

  def create
    item = Item.create(item_params)
    if item.save
      render :json => item, :except=>  [:created_at, :updated_at] , status: 201
    else
      render json: item.errors, status: 400
    end
  end

  def show
  end

  def index
    @items = Item.all
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
