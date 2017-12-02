require_relative '../common.rb'

class Crawl

  def crawl_top_page(url)
    open_html(url)
  end

  def parse_top_page(doc)
    link_arys = []
    doc.css('article .item > a').each{|node| link_arys << node[:href] }
    link_arys
  end

  def detail_page_save(link_arys)
    link_arys.each do |url|
      next if url.match(/qiita/)
      next unless url.include?('html')
      doc = open_html(url)
      G.find_or_create_by(text: doc.css('#contents').text, link: url)
      sleep 1
    end
  end

  private
    def open_html(url)
      html = open(url) do |f|
        f.read
      end
      Nokogiri::HTML.parse(html, nil, 'UTF-8')
    end
end

