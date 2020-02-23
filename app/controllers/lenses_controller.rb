class LensesController < ApplicationController
	before_action	:authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index
		@lenses = current_user.lenses.all
		@lense = Lense.new
	end
	def new
		@new_lense = Lense.new
	end
	def create
		@lense = Lense.new(lense_params)
		@lense.user_id = current_user.id
		if @lense.save
			redirect_to	lenses_path
		else
			render "/photos/new.html.erb"
		end
	end
	def edit
		@lense = Lense.find(params[:id])
	end
	def update
		@lense = Lense.find(params[:id])
		@lense.update(lense_params)
		redirect_to lenses_path
	end
	def destroy
		@lense = Lense.find(params[:id])
		@lense.destroy
		redirect_to	lenses_path
	end

	private
  	def lense_params
    	params.require(:lense).permit(:maker, :model)
  	end
end
