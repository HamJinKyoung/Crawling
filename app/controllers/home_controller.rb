require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
    @ranking = Array.new
        
    doc = Nokogiri::HTML(open("https://www.naver.com"))
    
    doc.css('.ah_roll .ah_roll_area ul li').each do |element|
        @ranking << {
          rank: element.css('span.ah_r').text,
          keyword: element.css('span.ah_k').text
        }
    end
    
    
    img = Nokogiri::HTML(open("https://news.naver.com/main/hotissue/sectionList.nhn?sid1=101&mid=hot&viewType=pc&cid=996387&nh=20181119102924"))
    @img_url = img.css('.thumb a img').map{|i| i['src']}
    
    
  end
end
