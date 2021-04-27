class Vinyl < ActiveRecord::Base
  belongs_to :user
  validates :title, :artist, :genre, :release_date, presence: true
end