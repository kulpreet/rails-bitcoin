class Address < ApplicationRecord
    validates :address, presence: true, length: { in: 26..35 }, uniqueness: true

    has_and_belongs_to_many :btc_transactions
end
