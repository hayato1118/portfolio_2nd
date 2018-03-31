class TopicsController < ApplicationController
  require "open-uri"
  require "nokogiri"

  def index
  	# @topics = Topic.page(params[:page]).search(params[:search])

    # @topic = Topic.search(params[:search])
    # @topics = Kaminari.paginate_array(@topic).page(params[:page])
    if params[:search].present?
          @topic = Topic.search(params[:search])
          @topic_search = Topic.search(params[:search])
          @hi_admin = request.url.include?("hi%21admin")
          @iamadmin = request.url.include?("iamadmin")
          if @topic == []
            @topic = Topic.all.order(created_at: :desc)
            flash.now[:notice] = "検索に一致する記事がありませんでした。"
          end
    else
      @topic = Topic.all.order(created_at: :desc)
    end

    @topics = Kaminari.paginate_array(@topic).page(params[:page]).per(10)

    @good_rank = Topic.find(TopicGood.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))
    @page_rank = Topic.order('page_count DESC').limit(10)
    @user_rank = User.order('follower_count DESC').limit(10)

    @all_good_count = 0
    @all_bad_count = 0
    @total = 0
    @num = 0
    @percent = 0
    @one_total = 0
    @topic.each do |topic|

    # 全体のできない数
      @all_good_count += topic.good_count

    # 全体のできた数
      @all_bad_count += topic.bad_count

    # 個別の記事の投票数
      @num = topic.bad_count + topic.good_count

    # もしカラムを作って保存する場合
    # topic.num == @num

    # 個別の記事の実装可能率
    # @one_total = ((topic.good_count.to_f.round(1)/ (@num).round(1) ) * 100).round(1)

    # もしカラムを作って保存する場合
    # topic.one_total == @one_total
    end
    # 全体の記事の投票数
    @total = @all_bad_count + @all_good_count
    # 全体の記事の実装可能率
    @percent = (@all_good_count.to_f) / (@total)
    @new_topic = Topic.new
    render :layout => 'index.application'
  end


  def confirm
     @topic = Topic.new(topic_params)
     @topic.tags.build
     @topic.user_id = current_user.id
     uri = @topic.url

    unless @topic.valid?(:url)
      flash[:notice] = "重複記事があります。"
      redirect_to topics_path
    else

       if uri == ""
        redirect_to topics_path
       else
   # if @topic.url.uniq == true
    # binding.pry
    # redirect_to topics_path
  # else
       @doc = Nokogiri::HTML(open(uri),nil,"utf-8")
  # =====================================  タイトルについて  ===============================================
        if @doc.css("h1").first != nil
            @h1 = @doc.css("h1").first.text 
        else
            flash[:notice] = "申し訳ありませんが、URLが非対応です。"
            redirect_to topics_path
        end


  # =====================================  タイトルについて  ===============================================
  # =====================================  コードについて    ===============================================
        if @doc.css("pre") != nil
            @pre = @doc.css("pre").text
        else
            flash[:notice] = "申し訳ありませんが、URLが非対応です。"
            redirect_to topics_path
        end
  # =====================================  コードについて  ===============================================
  # =====================================  本文について    ===============================================
        if @doc.css("p") != nil
            @p = @doc.css("p").text
        else
            flash[:notice] = "申し訳ありませんが、URLが非対応です。"
            redirect_to topics_path
        end
  # =====================================  本文について    ===============================================
  # =====================================  記述日について  ===============================================

        if @topic.url.include?("qiita") then
            @time = @doc.css("time").first.text
        elsif @topic.url.include?("teratail") then
            @time = @doc.css("time").first.text
        else
            @time = nil
        end

  # =====================================  記述日について  ===============================================
  # =====================================  著者について    ===============================================

        if  @topic.url.include?("qiita") then
            @author = @doc.xpath('//*[contains(concat( " ", @class, " " ), concat( " ", "it-Header_authorName", " " ))]').text
        elsif @topic.url.include?("teratail") then
            @author = @doc.xpath('//*[@id="l-headContents"]/div/div[2]/div/p[1]/a').text
        else
            @author = nil
        end
      end
    end
 end
# =====================================  著者について  ===============================================

  #    render :new if @topic.invalid?
  # end



  def show
  	@topic = Topic.find(params[:id])
    @topic_good = TopicGood.new()
    @topic_bad = TopicBad.new()
    @topic_comment = TopicComment.new
    impressionist(@topic, nil, :unique => [:session_hash])
    @topic.update(page_count: @topic.impressionist_count)
    @topic.update(good_count: @topic.topic_goods.count)
    @topic.update(bad_count: @topic.topic_bads.count)
    # @good_rank = Topic.find(TopicGood.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))

    @num = 0
    @one_total = 0
    # できた、できないの投票数
    @num = @topic.bad_count + @topic.good_count
    # 個別の記事の実装可能率
    # @one_total = ((@topic.good_count.to_f.round(1)/ (@num).round(1) ) * 100).round(0)
  end



  def create
  	@topic = Topic.new(topic_params)
  	@topic.user_id = current_user.id
    @tag_validat = params[:topic][:tags_attributes]["0"][:tag_name]
    @category_validat = params[:topic][:category_ids][1]
    if @tag_validat.blank? || @category_validat.blank?
      flash[:notice] = "タグまたはカテゴリーが入力されていません。"
      redirect_to topics_path
    else @topic.save
      flash[:notice] = "登録完了しました。"
      redirect_to topics_path
    # else
    #   flash[:notice] = "重複記事があります。"
    #   redirect_to topics_path
    end


    # if @topic.save
    # 	redirect_to topics_path
    # else
    #   flash[:notice] = "重複記事があります。"
    #   redirect_to topics_path
    # end
  end

  def edit
  	@topic = Topic.find(params[:id])
  end


  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    redirect_to topic_path(@topic.id)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash.now[:notice] = "記事を削除しました。"
    redirect_to topics_path
  end


  def top
      render :layout => 'top.application'
  end

  def password
    if params[:search].present?
      @topic = Topic.search(params[:search])
       @topic_search = Topic.search(params[:search])
      if @topic == []
        @topic = Topic.all
        flash.now[:notice] = "検索に一致する記事がありませんでした。"
      end
    else
      @topic = Topic.all
    end

    @topics = Kaminari.paginate_array(@topic).page(params[:page]).per(10)

    @good_rank = Topic.find(TopicGood.group(:topic_id).order('count(topic_id) desc').limit(10).pluck(:topic_id))
    @page_rank = Topic.order('page_count DESC').limit(10)
    @user_rank = User.order('follower_count DESC').limit(10)

    @all_good_count = 0
    @all_bad_count = 0
    @total = 0
    @num = 0
    @percent = 0
    @one_total = 0
    @topic.each do |topic|

    # 全体のできない数
      @all_good_count += topic.good_count

    # 全体のできた数
      @all_bad_count += topic.bad_count

    # 個別の記事の投票数
      @num = topic.bad_count + topic.good_count
    end

    @total = @all_bad_count + @all_good_count
    # 全体の記事の実装可能率
    @percent = (@all_good_count.to_f) / (@total)
    @new_topic = Topic.new
    render :layout => 'password.application'
  end


private
    def topic_params
      params.require(:topic).permit(:author ,:paragraph,:posted_day, :one_total, :re_body,:title,:url,:body,:topic_image, :tags_attributes => [:id, :tag_name, :topic_id, :_destroy],category_ids: [])
    end
end
