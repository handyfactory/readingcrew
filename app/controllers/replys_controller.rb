class ReplysController < ApplicationController
  def index
  end

  def new
  end

  def create
    Reply.create(
      comment: params[:comment],
      cbook_id: params[:id],
      user_id: params[:user_id]
      )
      
      redirect_to :back
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    
    redirect_to :back
  end
end
