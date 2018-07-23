class Reply < ActiveRecord::Base
    belongs_to :cbook
    belongs_to :user
    
    has_many :reply2s
end
