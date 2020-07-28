class AddressesController < ApplicationController

    def index
        @address = Address.new
        @addresses = Address.all
    end

    def show
        @address = Address.find(params[:id])
        @transactions = @address.btc_transactions.paginate(page: params[:page])
    end

    def new
    end

    def create
        @address = Address.new(address_params) 
        if @address.save
            FetchTransactionsJob.perform_later(@address.address)
        end
        @addresses = Address.all
        render :index
    end

    private

    def address_params
      params.require(:address).permit(:address)
    end

end
