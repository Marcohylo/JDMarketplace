class Order < ApplicationRecord
  belongs_to :user, required: false
end
