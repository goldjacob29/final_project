class Playlist < ApplicationRecord
  # Direct associations
  has_many   :song_instances,
             :dependent => :destroy

  has_many   :song_instances,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
