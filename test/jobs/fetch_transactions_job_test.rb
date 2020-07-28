require 'test_helper'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

class FetchTransactionsJobTest < ActiveJob::TestCase
  test "fetching a valid address" do
    VCR.use_cassette("fetch_addresses") do
      address = addresses(:one)
      address.update_attribute(:address, '1AJbsFZ64EpEfS5UAjAfcUG8pH8Jn3rn1F')

      FetchTransactionsJob.perform_now(address.address)

      address.reload
      assert_equal 81, address.n_tx
      assert_equal 52, address.btc_transactions.count
      assert_enqueued_jobs 1
    end
  end

  test "fetching a valid address will enqueue next job" do
    VCR.use_cassette("fetch_addresses") do
      address = addresses(:one)
      address.update_attribute(:address, '1AJbsFZ64EpEfS5UAjAfcUG8pH8Jn3rn1F')

      # assert_enqueued_with(job: FetchTransactionsJob, args: [address.address, 53]) do
      assert_enqueued_with(job: FetchTransactionsJob) do
        FetchTransactionsJob.perform_now(address.address)
      end
    end
  end
end
