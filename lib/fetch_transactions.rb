require 'blockchain'

module FetchTransactions

    MAX_TRANSACTIONS_PER_REQUEST = 50
    @@explorer = Blockchain::BlockExplorer.new

    def for_address(address, offset=0)
        begin
            return true, @@explorer.get_address_by_base58(
                address, MAX_TRANSACTIONS_PER_REQUEST, offset)
        rescue Blockchain::Client::APIException => e
            Rails.logger.debug e.message
            Rails.logger.debug e.backtrace
            return false, nil
        rescue Exception => e
            Rails.logger.debug e.message
            Rails.logger.debug e.backtrace
            return true, nil
        end
    end
end
