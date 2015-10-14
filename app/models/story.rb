class Story < ActiveRecord::Base
  validates :title, :presence => true

  has_many :sentences
  has_many :images
end
