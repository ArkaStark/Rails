class UnisController < ApplicationController

  def index
    @unis = Uni.all
  end

  def show
    @uni = Uni.find(params[:id])
  end

  def new
    @uni = Uni.new
  end

  def create
    @uni = Uni.new(uni_params)

    if @uni.save
      redirect_to @uni
    else
      render :new
    end
  end


  def edit
    @uni = Uni.find(params[:id])
  end

  def update
    @uni = Uni.find(params[:id])

    if @uni.update(uni_params)
      redirect_to @uni
    else
      render :edit
    end
  end


  def destroy
    @uni = Uni.find(params[:id])
    @uni.destroy

    redirect_to root_path
  end

  private
    def uni_params
      params.require(:uni).permit(:name, :country)
    end

end
