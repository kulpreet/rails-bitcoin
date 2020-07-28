class Output < ApplicationRecord
    belongs_to :address
    belongs_to :btc_transaction
end
