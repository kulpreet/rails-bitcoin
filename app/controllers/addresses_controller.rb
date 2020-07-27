class AddressesController < ApplicationController

    def index
        @address = Address.new
        @addresses = Address.all
    end

    def show
        @address = Address.find(params[:id])
    end

    def new
    end

    def create
        @address = Address.new(address_params)
 
        if @address.save
            flash[:notice] = "Address successfully saved."
        else
            flash[:error] = "Unable to save address."
        end
        @addresses = Address.all
        render :index
    end

    private

    def address_params
      params.require(:address).permit(:address)
    end

end
