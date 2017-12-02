require_relative '../common.rb'
require 'RMagick'

class ShowWordCloud

  def initialize(words)
    @magic = MagicCloud::Cloud.new(words, rotate: :free, scale: :log)
  end

  def write!(width, height, file_name)
    @magic.draw(width, height).write(file_name)
  end

end