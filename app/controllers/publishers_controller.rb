class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :update, :destroy]

  # GET /publishers
  def index
    @publishers = Publisher.all

    render json: @publishers
  end

  # GET /publishers/1
  def show
    render json: @publisher
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      render json: @publisher, status: :created, location: @publisher
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publishers/1
  def update
    if @publisher.update(publisher_params)
      render json: @publisher
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publishers/1
  def destroy
    @publisher.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def publisher_params
      params.require(:data)
            .require(:attributes)
            .permit(:name)
    end
end
