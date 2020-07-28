class Address < ApplicationRecord
    validates :address, presence: true, length: { in: 26..35 }

    has_and_belongs_to_many :btc_transactions
end
