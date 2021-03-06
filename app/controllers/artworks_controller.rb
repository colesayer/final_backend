class ArtworksController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    @artworks = @user.artworks
    render json: @artworks
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    render json: @artwork
  end

  def create
    @artwork = Artwork.new(user_id: params[:user_id], artist: params[:artist], title: params[:title], date: params[:date], materials: params[:materials], image_url: params[:image_url], dim_x: params[:dim_x], dim_y: params[:dim_y] )
    if @artwork.save
      render json: @artwork
    else
      render json: {errors: @artwork.errors.full_messages}, status: 422
    end
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork.update(user_id: params[:user_id], artist: params[:artist], title: params[:title], date: params[:date], materials: params[:materials], image_url: params[:image_url], dim_x: params[:dim_x], dim_y: params[:dim_y] )
      @user = User.find_by(id: params[:user_id])
      @artworks = @user.artworks
      render json: @artworks
    else
      render json: {errors: @artwork.errors.full_messages}, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    if @artwork.destroy
      @user = User.find_by(id: params[:user_id])
      @artworks = @user.artworks
      render json: @artworks
    else
      render json: {errors: @artwork.errors.full_messages}, status: 422
    end
  end


end
