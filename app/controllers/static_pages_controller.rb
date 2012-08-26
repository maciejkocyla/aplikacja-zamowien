class StaticPagesController < ApplicationController
  def about
  end

  def home
    @clients = Client.all.map{|client| client}
  end

  def help
  end
end
