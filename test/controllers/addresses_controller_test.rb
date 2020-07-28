require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  test "should get address form" do
    get new_address_url
    assert_response :success
  end

  test "should create an address from form" do
    post addresses_url, params: { 
      address: { 
        address: '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2',
        x: 100
      }
    }
    assert_select 'h1', '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2'
    assert_response :success

    assert_enqueued_jobs 1
  end


    test "should not create too long an address" do
      post addresses_url, params: { 
        address: { 
          address: '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2ABCDE',
          x: 100
        }
      }
      assert !Address.exists?(address: '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2ABCDE')
      assert_response :success
    end
  
end
