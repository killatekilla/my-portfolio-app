class PorfoliosController < ApplicationController
  def index
    @portfolio_item = Porfolio.all
  end

  def new
  	@portfolio_item = Porfolio.new
  end

  def create
  	@portfolio_item = Porfolio.new(params.require(:porfolio).permit(:title, :subtitle, :body))

  	respond_to do |format|
  		if @portfolio_item.save
  			format.html { redirect_to @portfolio_item, notice: 'Your portfolio item was created' }
  		else
  			format.html { render :new }
  		end
  	end
  end
end
