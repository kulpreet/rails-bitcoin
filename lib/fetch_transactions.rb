require blockchain

module FetchTransactions

    @@explorer = Blockchain::BlockExplorer.new

    def for(address)
        begin
            explorer.get_address_by_base58(address)
        rescue Blockchain::Client::APIException => e
            logger.debug e.backtrace
        end
    end
end
