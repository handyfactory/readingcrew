class Club < ActiveRecord::Base
    has_many :rolls
    has_many :users, through: :rolls
    has_many :cbooks
    mount_uploader(:image, PhotoUploader)
end
