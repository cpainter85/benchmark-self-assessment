class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_path, notice: 'Dog was successfully added'
    else
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dogs_path, notice: 'Dog was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    Dog.destroy(params[:id])
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed)
  end
end
