class StaticPagesController < ApplicationController
  include LoginHelper
  before_action :login_redirect?, only: [:feed]
  
  def feed
    @feed_itens = current_user.feed.order(:created_at, :id).paginate(:page => params[:page], :per_page => 5)
  end

  def home; end

  def about; end

  def contact; end
end
