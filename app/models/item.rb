class Item < ActiveRecord::Base
  has_and_belongs_to_many :feeds

  belongs_to :user

  validates_presence_of :title, :link, :description, :date, :user_id

  validates_uniqueness_of :link

  validate :dead_link

  require 'net/http'
  def dead_link
    url = URI.parse(link)
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path)
    errors.add(:link, :dead) unless res.code == '200'
  end
end
