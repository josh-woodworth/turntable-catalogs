class Vinyl < ActiveRecord::Base
  belongs_to :user
  validates :title, :artist, :genre, :release_year, presence: true
end