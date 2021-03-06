class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy, :cbooks]
  before_action :authenticate_user!, except: [:apply]
  
  def apply
  end
  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.page(params[:page]).per(6)
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    
  end
  
  def cbooks
    @cbooks = @club.cbooks.order(register_at: :desc).page(params[:page]).per(4)
    @club_cbooks = Club.find(params[:id]).cbooks
    
    reply=[]
    reply2=[]
    
    @club_cbooks.each do |cbook|
      reply = cbook.replies
      reply2 = cbook.reply2s
    end

    @total = []
    
    reply.each do |r|
      @total.push(r)
    end
    reply2.each do |r2|
      @total.push(r2)
    end
    
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    
    respond_to do |format|
      if @club.save
        @club.users.push(User.find_by(email: @club.captain_email))
        @club.rolls.find_by(user_id: User.find_by(email: @club.captain_email).id).update(relation: "captain")
        
        
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def follow
    Club.find(params[:id]).users.push(current_user)
    Club.find(params[:id]).rolls.find_by(user_id: current_user.id).update(relation: "follow")
    
    redirect_to :back
  end
  
  def unfollow
    Club.find(params[:id]).users.delete(current_user)
 
    redirect_to :back
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:title, :desc, :time, :location, :pay, :image, :captain_email)
    end
end
