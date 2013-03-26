class PagesController < ApplicationController
	def index
		@pages = Page.search(params[:search])
	end

	def show
		@page = Page.find(params[:id])
	end

	def new
		@page = Page.new
	end

	def create
		@page = Page.new(params[:page])

		if @page.save
			redirect_to pages_path, :notice => "The page was saved"
		else
			render "new"
		end
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		@page.update_attribute(:created_by, current_user.username)
		if @page.update_attributes(params[:page])
			redirect_to pages_path, :notice => "The page was updated"
		else
			render "edit"
		end
	end

	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		redirect_to pages_path, :notice => "The page has been deleted"
	end

	def search
		@pages = Page.search(params[:search])
	end
end
