class ListsController < ApplicationController
  def index
    @lists = policy_scope(List)
  end

  def new
    @list = List.new
    authorize(@list)
  end

  def create
    @list = List.new(list_params)
    authorize(@list)

    if @list.save
      redirect_to lists_path, notice: "List created!"
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
