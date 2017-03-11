class SongInstance < ApplicationRecord
  # Direct associations

  belongs_to :song

  belongs_to :playlist

  # Indirect associations

  # Validations

end
