class Reply2sController < ApplicationController
  def index
  end

  def new
  end

  def create
    Reply2.create(
      comment: params[:comment],
      reply_id: params[:id],
      user_id: params[:user_id],
      cbook_id: params[:cbook_id]
      )
    
    redirect_to :back
  end

  def show
  end

  def edit
    reply = Reply.find(params[:id])
    reply.update(reply2: true)
    
    redirect_to :back
  end

  def update
  end

  def destroy
    reply2 = Reply2.find(params[:id])
    reply2.destroy
    
    redirect_to :back
  end
end
