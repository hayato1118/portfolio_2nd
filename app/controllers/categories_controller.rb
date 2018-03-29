class CategoriesController < ApplicationController

	def index
		@category_name = category_params

		@categories = Topic.joins(:categories).where('category_name = ?', @category_name )


		 if params[:search].present?
      @topic = Topic.search(params[:search])
       @topic_search = Topic.search(params[:search])
      if @topic == []
        @topic = Topic.all
        flash.now[:notice] = "検索に一致する商品がありませんでした。"
      end
    else
      @topic = Topic.all
    end
    @topics = Kaminari.paginate_array(@topic).page(params[:page])
    @good_rank = Topic.find(TopicGood.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))
    @page_rank = Topic.order('page_count DESC').limit(10)
    @user_rank = User.order('follower_count DESC').limit(10)


     @all_good_count = 0
    @all_bad_count = 0
    @total = 0
    @num = 0
    @percent = 0

    @categories.each do |topic|

    # 全体のできない数
      @all_good_count += topic.good_count

    # 全体のできた数
      @all_bad_count += topic.bad_count

    # 個別の記事の投票数
      @num = topic.bad_count + topic.good_count

    end
    # 全体の記事の投票数
    @total = @all_bad_count + @all_good_count
    # 全体の記事の実装可能率
    @percent = (@all_good_count.to_f) / (@total)

    @new_topic = Topic.new
	end


	private
	    def category_params
	       params.permit(:category_name)[:category_name]
	    end

end
