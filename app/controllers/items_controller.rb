class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :fix_datetime_params, only: [:create, :update]

  def index
    @items = Kaminari.paginate_array(ItemDecorator.decorate_collection(Item.all)).page(params[:page])
  end

  def show
    @item = @item.decorate
  end

  def new
    @item = Item.new
    @item.feeds << Feed.find(1)
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: t('item.create', name: @item.title) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: t('item.update', name: @item.title) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
  name = @item.title
    @item.destroy
      respond_to do |format|
      format.html { redirect_to items_url, notice: t('item.destroyed', name: name) }
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :link, :description, :date, :user_id, feed_ids: [])
  end

  def fix_datetime_params
      unless params[:item]["date"].empty? or params[:item]["time"].empty?
        date = Date.parse(params[:item]["date"])
        time = Time.parse(params[:item]["time"])
        datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min) 
        params[:item].merge!({"date" => datetime})
      end 
      params[:item].reject! {|k| k == 'time'}
  end 

end
