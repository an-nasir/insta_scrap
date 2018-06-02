require 'insta_helper.rb'
class ApplicationController < ActionController::Base
  before_action :set_min_max

  def search
    render 'layouts/search'
  end

  def search_results
    # binding.pry
    results = RubyInstagramScraper.search(params[:tag])['hashtags'].pluck('hashtag')
    if params[:post_range].present?
      range = params[:post_range].split(';').map(&:to_i)
      results = results.select {|_, e| _["media_count"].between?(range.first, range.last) }
    end
    results = results.pluck('name')
    @hash_tags = []
    # binding.pry
    results.each do |result|
      @hash_tags += RubyInstagramScraper.search(result)['hashtags'].pluck('hashtag').pluck('name', 'media_count') if result.ascii_only?
    end
    # binding.pry
    @hash_tags = @hash_tags.uniq { |s| s.first }
    if params[:post_range].present?
      range = params[:post_range].split(';').map(&:to_i)
      @hash_tags = @hash_tags.select { |_,e| e.between?(range.first, range.last)  }
    end

    
    # make query to tag 
    # get 
    # if tag has a post within last 30 days
    @hash_tags = tag_pruning @hash_tags if params[:prune].present?
    @hash_tags = @hash_tags.sort_by(&:last).reverse
    render 'layouts/search'
  end

  protected  
    # def after_sign_in_path_for(resource)
    #   redirect_to :search
    # end
    def tag_pruning tags
      pruned_tags = []
      chunks = tags.in_groups_of( (tags.count/20).to_i )
      # binding.pry

      chunks.each_with_index do |chunk, i|
        # binding.pry
        if chunk.first.first.ascii_only?
          tag_nodes = InstaHelper.get_tag_media_nodes(chunk.first.first)
          puts "=========== #{tag_nodes.count} @ #{i} ================"
          unless (DateTime.now  - DateTime.strptime(tag_nodes.first["node"]["taken_at_timestamp"].to_s,'%s')).to_i > 30
            puts "<<<<<<<<<<<<<<< Added #{i}th tag >>>>>>>>>>>>>>>>>>"
            pruned_tags.push chunk
          end
        end
      end
      pruned_tags.flatten.in_groups_of(2)
    end

    def set_min_max
      @web_settings = WebSetting.first
    end
end
