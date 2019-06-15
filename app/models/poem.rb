class Poem < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 30}}
  validates :discription, {length: {maximum: 280}}
end
