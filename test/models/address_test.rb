require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test "address creation without hash" do
    address = Address.new
    assert_not address.save, "Saved address without a hash"
  end

  test "address creation with tiny hash" do
    address = Address.new(address: 'abcde')
    assert_not address.save, "Saved address with a tiny hash"
  end

  test "address creation with too long a hash" do
    address = Address.new(address: 'abcdef'*7)
    assert_not address.save, "Saved address with too long a hash"
  end

  test "address creation with a valid length hash" do
    address = Address.new(address: '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2')
    assert address.save, "Couldn't save p2pkh address"
  end

  test "associations with btc transaction, inputs and outputs" do
    address = addresses(:one)
    assert_equal 2, address.btc_transactions.count
    assert_equal 1, address.btc_transactions.where(tx_hash: "hash_1").count

    tx1 = address.btc_transactions.where(tx_hash: "hash_1").first
    assert_equal 1, tx1.inputs.count
    assert_equal 2, tx1.outputs.count
  end

end
