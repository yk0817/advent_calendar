require './common'

URL = 'https://gsacademy.tokyo/'.freeze

# クロール
@crawl = Crawl.new
doc = @crawl.crawl_top_page(URL)
@crawl.detail_page_save(@crawl.parse_top_page(doc))

# mecab!
@mecab = Parse.new

# # グラフ作成
ShowWordCloud.new(@mecab.parse_text).write!(1280, 1280, 'draw.png')