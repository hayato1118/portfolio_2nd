
Category.create(category_name: 'Ruby')
Category.create(category_name: 'Ruby on Rails')
Category.create(category_name: 'PHP')
Category.create(category_name: 'Python')
Category.create(category_name: 'HTML')
Category.create(category_name: 'CSS')
Category.create(category_name: 'jQuery')
Category.create(category_name: 'Java')
Category.create(category_name: 'JavaScript')

Admin.create!(email: 'admin@gmail.com', password: '123456')

# User.create!(name: 'hayato1', email: 'sample1@yahoo.co.jp', password: '123456')
# User.create!(name: 'hayato2', email: 'sample2@yahoo.co.jp', password: '123456')
# User.create!(name: 'hayato3', email: 'sample3@yahoo.co.jp', password: '123456')

30.times do |i|
	gimei = Gimei.name
	User.create(:email => "sample#{1+i}@yahoo.co.jp",
				:name => gimei.last.romaji ,
				:password => "123456",)
end

# Topic.create!(user_id:'1' ,title: 'cocoonで1対多のフォームを作る', url: 'http://techmory.hateblo.jp/entry/171107-cocoon',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'Rails4でcollection_check_boxesを使って、多対多の関連をチェックボックスで設定する', url: 'https://qiita.com/hamichamp/items/8cf980e6d5ca9fd7e96f',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'Railsとdeviseでユーザーの新規登録のみできないようにする', url: 'https://qiita.com/iguchi1124/items/bb25cf650348f31ea37e',page_count: '23124')
# Topic.create!(user_id:'1' ,title: 'deviseのログインフォームを別のコントローラーから利用する', url: 'https://qiita.com/ttaka66/items/33917826b91367e4c85a',page_count: '23123')
# Topic.create!(user_id:'2' ,title: 'お名前.com で取ったドメインを使う', url: 'https://qiita.com/megane42/items/df84f87c0bdcdd015eb6',page_count: '12331')
# Topic.create!(user_id:'3' ,title: 'お気に入り機能', url: 'http://labyrinth-of-wisdom.hatenadiary.com/entry/2016/03/03/085059',page_count: '21312')
# Topic.create!(user_id:'1' ,title: 'CSS で指定幅を超えた文字列を切り取り「…」を付加する方法', url: 'http://monopocket.jp/blog/css/2866/',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'セル内で自動改行させない', url: 'http://www.tagindex.com/html_tag/table/td_nowrap.html',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'kaminari total_pages エラー 解決', url: 'http://hamasyou.com/blog/2011/06/14/kaminari-paginate-array/',page_count: '12341')
# Topic.create!(user_id:'1' ,title: '親子関係のある検索', url: 'https://qiita.com/QUANON/items/0033a5adb76d0cb963cd',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'Rails - 通貨フォーマットの扱い', url: 'https://qiita.com/azusanakano/items/c2e73521d5a4bdfa73d6',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'impressionist gemを使ってrailsでページビューをトラッキングする', url: 'https://qiita.com/yimajo/items/995584ede90be1a873ce',page_count: '12341')
# Topic.create!(user_id:'1' ,title: 'Rails5でカート機能を作るためのロジックを作ってみた', url: 'https://qiita.com/DialBird/items/89ce3a0f25c9dfdb38c1',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'Rails4でcollection_check_boxesを使って、多対多の関連をチェックボックスで設定する', url: 'https://qiita.com/hamichamp/items/8cf980e6d5ca9fd7e96f',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'SVG Stroke Animation | HTML & CSS', url: 'https://www.youtube.com/watch?v=y0Ic8QcvyK8&t=1s',page_count: '12341')
# Topic.create!(user_id:'1' ,title: 'Railsとdeviseでユーザーの新規登録のみできないようにする', url: 'https://qiita.com/iguchi1124/items/bb25cf650348f31ea37e',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'deviseのログインフォームを別のコントローラーから利用する', url: 'https://qiita.com/ttaka66/items/33917826b91367e4c85a',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'seed gimei は、日本人の名前や、日本の住所をランダムに返すライブラリ', url: 'https://github.com/willnet/gimei',page_count: '12341')
# Topic.create!(user_id:'1' ,title: 'Railsでメール自動配信機能をつくるまでの道程', url: 'https://qiita.com/Yama-to/items/823baf26bba3193712ea',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'RailsアプリへのGoogleAnalyticsの導入手順', url: 'https://qiita.com/lni_T/items/c298cab5a6320e5e0ab8',page_count: '12341')
# Topic.create!(user_id:'3' ,title: '背景を斜めにする、1カラムのスクロール型のページで要素の継ぎ目を斜めにするテクニック', url: 'http://9-bb.com/1%E3%82%AB%E3%83%A9%E3%83%A0%E3%81%AE%E3%82%B9%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%AB%E5%9E%8B%E3%81%AE%E3%83%9A%E3%83%BC%E3%82%B8%E3%81%A7%E8%A6%81%E7%B4%A0%E3%81%AE%E7%B6%99%E3%81%8E%E7%9B%AE%E3%82%92/',page_count: '12341')
# Topic.create!(user_id:'1' ,title: '【Rails】いいねボタンを作ろう part1/2', url: 'https://qiita.com/mohira/items/9ae35773e6209adbf0a0',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'railsでフォロー機能をつける。', url: 'https://qiita.com/kitaokeita/items/59b625e0c43a62f5fe6a',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'プログラマー歴、半年未満でもわかるpay.jp導入(rails)', url: 'https://qiita.com/nekononeko_53/items/972e878e31b135b7a048',page_count: '12341')
# Topic.create!(user_id:'1' ,title: 'Railsでdeviseひとつで複数モデルを管理しよう', url: 'https://qiita.com/Yama-to/items/54ab4ce08e126ef7dade',page_count: '3131')
# Topic.create!(user_id:'2' ,title: 'Railsのルーティングあれこれ', url: 'https://qiita.com/senou/items/f1491e53450cb347606b',page_count: '12341')
# Topic.create!(user_id:'3' ,title: 'Ruby on Rails ~OmniAuthによるTwitter/FacebookのOAuth認証を実装（コードメモ）~事前に作成したDeviseによる認証と併用', url: 'https://qiita.com/wtb114/items/a617474f1d31fa9e7c53',page_count: '12341')

