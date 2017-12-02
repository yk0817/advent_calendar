require_relative '../common.rb'

class Parse
  def initialize
    @natto = Natto::MeCab.new
  end

  def parse_text
    arys = []
    db_text.each do |text|
      @natto.parse(text) do |text|
        # 日本語フォント対応が面倒なので、今回はスキップ
        arys << text.surface if text.surface.size > 4 && text.surface.match(/^[A-Za-z0-9]+$/)
      end
    end
    arys.inject(Hash.new(0)){|h, k| h[k] += 1; h}.select{|k,v| v >= 10}.to_a
  end

  private
    def db_text
      G.pluck(:text)
    end

end