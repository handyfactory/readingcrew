class Cbook < ActiveRecord::Base
    belongs_to :user
    has_many :replies
    belongs_to :club
end
