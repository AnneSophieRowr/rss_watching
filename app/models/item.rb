class Item < ActiveRecord::Base
  has_and_belongs_to_many :feeds

  belongs_to :user

  validates_presence_of :title, :link, :description, :date, :user_id

  validates_uniqueness_of :link

  validate :valid_link

  require 'net/http'
  def valid_link
    begin
      url = URI.parse(link)
      req = Net::HTTP.get_response(url.host, '/')
      errors.add(:link, :dead) unless req.code == '200'
    rescue URI::InvalidURIError
      errors.add(:link, :invalid)
    end
  end
end
