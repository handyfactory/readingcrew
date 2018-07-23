class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :introduce, :services]
  def index
    @cbook = Cbook.all
  end
  
  def mypage
  end
  
  def introduce
    @user = User.all
    @cbook = Cbook.all
    @club = Club.all
  end
  
  def services
  end
  
  def p_read
    
  end
  
  def calendar
    @calendarList = [{ googleCalendarId: 'bapvs9jeql1tok352c5kkp06go@group.calendar.google.com'}]
  end
end
