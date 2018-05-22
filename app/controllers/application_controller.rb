class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def search
    render 'layouts/search'
  end

  def search_results
    results = RubyInstagramScraper.search(params[:tag])['hashtags'].pluck('hashtag').pluck('name')
    @hash_tags = []
    results.each do |result|
      @hash_tags = @hash_tags + RubyInstagramScraper.search(result)['hashtags'].pluck('hashtag').pluck('name', 'media_count') if result.ascii_only?
    end
    @hash_tags = @hash_tags.uniq
    @hash_tags = @hash_tags.sort_by(&:last).reverse
    render 'layouts/search'
  end

  # protected  
  #   def after_sign_in_path_for(resource)
  #     redirect_to :search
  #   end
end
