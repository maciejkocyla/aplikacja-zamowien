class StaticPagesController < ApplicationController
  def about
  end

  def home
    if signed_in?
      @clients = current_group.clients.all.map{|client| client}
    end
  end

  def help
  end
end
