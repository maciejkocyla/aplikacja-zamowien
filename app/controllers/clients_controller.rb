class ClientsController < ApplicationController
  def new
    @client = Client.new
#    @client = current_group.clients.new
    @order = @client.orders.new
  end
 
  def show
    @client = Client.find(params[:id])
  end

  def index
    @clients = current_group.clients.paginate(page: params[:page])
  end

  def create
    @client = current_group.clients.new(params[:client])
    if @client.save
      flash[:success] = "donano nowego klienta"
      redirect_to client_index_path
    else
      render 'new'
    end
  end

  def destroy
    Client.find(params[:id]).destroy
    flash[:success] = "klient usuniety."
    redirect_to client_index_path

  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:success] = "dane aktualne"
      redirect_to client_index_path
    else
      render 'edit'
    end
  end

  def create_new_order
    @client = Client.where(:id => params[:client_id]).first || Client.new
    @clients = Client.all
    8.times {@client.products.build}
  end

end
