class RibbitsController < ApplicationController
  def create
    @ribbit = Ribbit.new(params[:ribbit])
    @ribbit.userid = current_user.id</p>

    if @ribbit.save
        redirect_to current_user
      else
        flash[:error] = "Problem!"
        redirect_to current_user
      end
  end
end
