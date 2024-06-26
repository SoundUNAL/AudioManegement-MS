class TagsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  # Get all tags
	def index
		@tags = Tag.all

		# Devolver JSON
		render json: @tags
	end

  # Get tag by id
  def show
		# Devolver JSON
		render json: tag
	end

	# Post a new tag
	def create
		@tag = Tag.new(tag_params)

		# Devolver JSON
		if @tag.save
			render json: { message: "Tag uploaded successfully" }, status: :created
		else
			render json: { error: "The tag was not uploaded", errors: @tag.errors.full_messages }, status: :unprocessable_entity
		end
	end

	# Put for a tag
	def update
		# Devolver JSON
		if tag.update(tag_params)
			render json: @tag
		else
			render json: @tag.errors, status: :unprocessable_entity
		end
	end

	# Delete a tag
	def destroy
		tag.destroy
	end

	# Read params
	private

	def tag_params
		params.permit(:name)
	end

	def tag
		@tag = Tag.find(params[:id])
	end
end
