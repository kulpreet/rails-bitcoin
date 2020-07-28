class BtcTransaction < ApplicationRecord
    has_and_belongs_to_many :addresses

    has_many :inputs
    has_many :outputs
end
