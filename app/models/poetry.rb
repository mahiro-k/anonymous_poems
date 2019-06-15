class Poetry < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 600}}
end
