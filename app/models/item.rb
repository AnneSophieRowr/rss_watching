class Item < ActiveRecord::Base
  has_and_belongs_to_many :feeds

  belongs_to :user

  validates_presence_of :title, :link, :description, :date, :user_id
end
