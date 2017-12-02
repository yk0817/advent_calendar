require 'active_record'
require 'natto'
require 'nokogiri'
require 'open-uri'
require 'pp'
require 'magic_cloud'
require 'RMagick'
# include Magicks



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

# words = [
#   ['test', 50],
#   ['me', 40],
#   ['tenderly', 30],
# ]
#
# cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :log).draw(960, 960)
# cloud.write('test.png')
#


