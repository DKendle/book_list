class Book < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :reviews, allow_destroy: true
    validates_presence_of :title
    scope :not_read, -> { where(read: false ) }
    scope :own, -> { where(currently_own: true) }
end