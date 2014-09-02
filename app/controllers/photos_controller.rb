class PhotosController < ApplicationController
	before_filter :authorize, except: [:show, :index]

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			flash[:notice] = "Photo saved"
		  redirect_to user_path(current_user)
		else
      flash[:alert] = "Photo not saved"
      render 'new'
    end
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to user_path(current_user)
		flash[:notice] = "Photo deleted"
	end
private
	def photo_params
		params.require(:photo).permit(:avatar, :user_id)
	end
end

