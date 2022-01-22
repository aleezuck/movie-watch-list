class ListsController < ApplicationController
  skip_after_action :verify_authorized, only: :my_lists
  after_action :verify_policy_scoped, only: :my_lists

  def index
    @lists = policy_scope(List)
  end

  def show
    @list = List.find(params[:id])
    authorize(@list)
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
    authorize(@list)
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize(@list)

    if @list.save
      redirect_to list_path(@list), notice: "List created!"
    else
      render :new
    end
  end

  def my_lists
    @lists = policy_scope(List).where(user: current_user)
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
