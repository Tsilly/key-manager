class KeychainsController < ApplicationController
  before_action :find_keychain, only: [:edit, :show, :update, :destroy]
  before_action :collect_categories, only: [:new, :edit, :create, :update]
  def index
    @keychains = Keychain.all
  end

  def show
  end

  def new
    @keychain = Keychain.new
  end

  def create
    @keychain = Keychain.new(keychain_params)
    if @keychain.save
      flash[:success] = "Successfully created!"
      redirect_to keychains_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @keychain.update(keychain_params)
      flash[:success] = "Successfully saved!"
      redirect_to keychain_path(@keychain)
    else
      render action: "edit.html.haml"
    end
  end

  def destroy
    if @keychain.destroy
      flash[:success] = "Successfully deleted!"
      redirect_to keychains_path
    else
      redirect_to :back
    end
  end

  private
    def find_keychain
      @keychain = Keychain.find(params[:id])  
    end

    def keychain_params
      params.require(:keychain).permit(:title, :username, :url, :password, :category_id)
    end

    def collect_categories
      @categories = Category.all
    end
end