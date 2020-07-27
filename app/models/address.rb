class Address < ApplicationRecord
    validates :address, presence: true, length: { in: 26..35 }
end
