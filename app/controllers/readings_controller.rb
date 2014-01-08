class ReadingsController < ApplicationController

	def index 
    @readings = current_user.readings.paginate page: params[:page], 
                                                   per_page: 2
  end

end