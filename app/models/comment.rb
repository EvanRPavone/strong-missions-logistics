class Comment < ApplicationRecord
  has_rich_text :reply
  belongs_to :trip
  belongs_to :user
end
