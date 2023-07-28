class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten created!"
      redirect_to @kitten
    else
      flash.now[:error] = "Kitten not created!"
      render 'new'
    end
  end

  def edit
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten updated!"
      redirect_to @kitten
    else
      flash.now[:error] = "Kitten not updated!"
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten deleted!"
    redirect_to root_url
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
