class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def search
    render 'layouts/search'
  end

  def search_results
    results = RubyInstagramScraper.search(params[:tag])
    @hash_tags = results['hashtags'].pluck('hashtag').pluck('name', 'media_count')
    render 'layouts/search'
  end

  # protected  
  #   def after_sign_in_path_for(resource)
  #     redirect_to :search
  #   end
end
