class Item < ActiveRecord::Base

  has_and_belongs_to_many :feeds

  belongs_to :user

  validates_presence_of :title, :article_link, :description, :date, :user_id

  validates_uniqueness_of :article_link

  validate :valid_article_link

  require 'net/http'
  def valid_article_link
    begin
      url = URI.parse(article_link)
      req = Net::HTTP.get_response(url.host, '/')
      logger.error "[valid_article_link] Dead link: #{req.code}"
      errors.add(:article_link, :dead) unless req.code == '200'
    rescue URI::InvalidURIError => e
      errors.add(:article_link, :invalid)
      logger.error "[valid_article_link] Error testing url: #{e}"
    end
  end
end
