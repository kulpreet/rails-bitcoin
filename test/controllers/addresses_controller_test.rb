require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest

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
    assert_redirected_to address_path(Address.last)
    assert_equal 'Address successfully saved.', flash[:notice]
    end


    test "should not create too long an address" do
      post addresses_url, params: { 
        address: { 
          address: '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2ABCDE',
          x: 100
        }
      }
      assert_equal 'Unable to save address.', flash[:error]
      end
  
end
