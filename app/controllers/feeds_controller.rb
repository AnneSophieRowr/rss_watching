class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Kaminari.paginate_array(FeedDecorator.decorate_collection(Feed.all)).page(params[:page])
  end

  def show
    respond_to do |format|
      format.html {}
      format.atom { render layout: false }
    end
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to feeds_path, notice: t('feed.create', name: @feed.name) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to feeds_path, notice: t('feed.update', name: @feed.name) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
  name = @feed.name
    @feed.destroy
      respond_to do |format|
      format.html { redirect_to feeds_url, notice: t('feed.destroyed', name: name) }
    end
  end

  private
  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:name, item_ids: [])
  end

end
