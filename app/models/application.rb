class Application < ActiveRecord::Base
  has_and_belongs_to_many :positions
  belongs_to :user
end
