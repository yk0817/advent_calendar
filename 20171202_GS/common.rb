require 'active_record'
require 'natto'
require 'nokogiri'
require 'open-uri'
require 'pp'
require 'magic_cloud'
require 'RMagick'
require './crawl/crawl'
require './visual/scraped_parse'
require './visual/show_word_cloud'

ActiveRecord::Base.establish_connection(
        :adapter  => 'mysql2',
        :database => 'blog',
        :host     => 'localhost',
        :username => 'root',
        :password => ''
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

Time.zone_default =  Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

class G < ActiveRecord::Base; end
