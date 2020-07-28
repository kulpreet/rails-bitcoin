class FetchTransactionsJob < ApplicationJob
  queue_as :default

  include FetchTransactions

  def perform(*args)
    return unless args[0]

    Rails.logger.debug "Starting with #{args}"
    puts "Starting with #{args}"

    address = Address.where(address: args[0]).first

    offset = args[1] || 0
    if address
      # fetch once, so we can use this same job for refreshing address
      # transactions. The n_tx field is what will change in subsequent runs
      enqueue, result = for_address(args[0], offset)
      if result
        address.update_attributes(
          hash160: result.hash160,
          address: result.address,
          n_tx: result.n_tx,
          total_received: result.total_received,
          total_sent: result.total_sent,
          final_balance: result.final_balance,
          last_fetched_at: Time.now
        )
        result.transactions.each do |tx|
          BtcTransaction.create_from(tx, address)
        end
      end
      Rails.logger.debug "Enqueue is #{enqueue}"
      puts "Enqueue is #{enqueue}"
      address.reload
      if enqueue && address.btc_transactions.count < address.n_tx
        # enque the job again with a delay so we can manage the request
        # rate to blockchain api
        offset = address.btc_transactions.count + 1
        Rails.logger.debug "Enqueue with #{offset}"
        puts "Enqueue with #{offset}"
        FetchTransactionsJob.set(wait: 5.seconds).perform_later(address.address, offset)
      end
    end
  end

end
