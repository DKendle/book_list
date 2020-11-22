class User < ApplicationRecord
    has_many :reviews
    has_many :books, through: :reviews
    has_secure_password
    accepts_nested_attributes_for :books, allow_destroy: true
end
