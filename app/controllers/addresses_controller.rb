class AddressesController < ApplicationController

    def show
        @address = Address.find(params[:id])
    end

    def new
    end

    def create
        @address = Address.new(address_params)
 
        if @address.save
            flash[:notice] = "Address successfully saved."
            redirect_to @address
        else
            flash[:error] = "Unable to save address."
            render :new
        end
    end

    private

    def address_params
      params.require(:address).permit(:address)
    end

end
