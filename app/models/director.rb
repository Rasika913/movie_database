class Director < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :movies,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
