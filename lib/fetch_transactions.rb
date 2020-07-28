require 'blockchain'

module FetchTransactions

    @@explorer = Blockchain::BlockExplorer.new

    def for(address)
        begin
            return true, explorer.get_address_by_base58(address)
        rescue Blockchain::Client::APIException => e
            logger.debug e.message
            logger.debug e.backtrace
            return false, nil
        rescue Exception
            logger.debug e.message
            logger.debug e.backtrace
            return true, nil
        end
    end
end
