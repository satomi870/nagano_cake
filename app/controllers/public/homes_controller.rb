class Public::HomesController < ApplicationController
  
  def top
    @items = Item.last(4) #lastは元々rubyに入ってる新着を表すメソット
  end

  def about
  end
end
