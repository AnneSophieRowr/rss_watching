class Feed < ActiveRecord::Base
  has_and_belongs_to_many :items

  validates_presence_of :name, :slug

  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: :slugged

end
