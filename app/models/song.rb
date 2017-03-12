class Song < ApplicationRecord
  # Direct associations

  has_many   :song_instances,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :artist, :uniqueness => { :scope => [:name] }

  validates :artist, :presence => true

  validates :genre, :presence => true

  validates :name, :presence => true

  validates :year, :presence => true, :numericality => {:greater_than => 1000, :less_than => 2018}

end
