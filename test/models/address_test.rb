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

end
