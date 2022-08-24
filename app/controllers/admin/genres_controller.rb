class Admin::GenresController < ApplicationController
  def new
    
  end
  
  def create
    @genre=Genre.new(genre_params)
    @genre.save
    
  end
  
  def index
    @genre=Genre.new
  end

  def edit
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end

end
