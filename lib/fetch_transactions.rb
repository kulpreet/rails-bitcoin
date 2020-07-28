require 'blockchain'

module FetchTransactions

    @@explorer = Blockchain::BlockExplorer.new

    def for_address(address)
        begin
            return true, @@explorer.get_address_by_base58(address)
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
