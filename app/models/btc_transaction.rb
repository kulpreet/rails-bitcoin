class BtcTransaction < ApplicationRecord
    has_and_belongs_to_many :addresses

    has_many :inputs
    has_many :outputs

    def self.create_from(tx, address)
        t = create(
            double_spend: tx.double_spend,
            block_height: tx.block_height,
            time: tx.time,
            relayed_by: tx.relayed_by,
            tx_hash: tx.hash,
            tx_index: tx.tx_index,
            version: tx.version,
            size: tx.size,
          )
        t.addresses << address
        t.save
        tx.inputs.each do |input|
            t.inputs.create(
                n: input.n,
                value: input.value,
                tx_index: input.tx_index,
                input_type: input.type,
                script: input.script,
                script_sig: input.script_sig,
                sequence: input.sequence,
                address: address
            )
        end
        tx.outputs.each do |output|
            t.outputs.create(
                n: output.n,
                value: output.value,
                tx_index: output.tx_index,
                script: output.script,
                spent: output.spent,
                address: address
            )
        end
    end
end
