class CbooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @cbooks = Cbook.all
  end

  def new
    @club_id = params[:club_id]
    @sbooks = Searching.all
    @choose = Choose.first
    
  end

  def create
    Choose.destroy_all
    
    Cbook.create(
      title: params[:title],
      authors: params[:authors],
      category: params[:category],
      club_id: params[:club_id],
      contents: params[:contents],
      why: params[:why],
      image: params[:thumbnail],
      times: params[:times],
      register_at: params[:register_at]
      )
      
      
    redirect_to "/clubs/#{params[:club_id]}"
    
  end

  def show
    @cbook = Cbook.find(params[:id])
  end
  

  def edit
  end

  def update
  end

  def destroy
  end
  
  def searching
    Searching.destroy_all
    Choose.destroy_all
    
    url = "https://dapi.kakao.com/v2/search/book?query="
    title = params[:title]
    
    response = RestClient.get(
      URI.encode("#{url}#{title}&target=title"),
      headers = {
        Authorization: "KakaoAK 0ece3905d8f77f25e847d67c939ec3cb" 
      }
    )
    
    @datas = JSON.parse(response)
    
    @datas["documents"].each do |data|
      Searching.create(
        title: data["title"],
        authors: data["authors"],
        thumbnail: data["thumbnail"],
        category: data["category"],
        contents: data["contents"]
        )
    end
    
    redirect_to  "/cbooks/new/#{params[:club_id]}"
  end
  
  def choose
    
      Choose.create(
        title: params[:title],
        authors: params[:authors],
        thumbnail: params[:thumbnail], 
        category: params[:category],
        contents: params[:contents]
        )
        
      @club_id = params[:club_id]
      
      redirect_to "/cbooks/new/#{params[:club_id]}"
      
  end
  
  def reply
    
    Reply.create(
      comment: params[:comment],
      cbook_id: params[:id],
      user_id: params[:user_id]
      )
      
      redirect_to :back
      
  end
  
  def reply2
    reply = Reply.find(params[:id])
    reply.update(reply2: true)
    
    redirect_to :back
  end
  
  
  def reply2_register
    reply = Reply.find(params[:id])
    
    Reply2.create(
      comment: params[:comment],
      reply_id: params[:id],
      user_id: params[:user_id]
      )
    
    redirect_to :back
  end
end
