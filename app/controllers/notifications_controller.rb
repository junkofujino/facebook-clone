class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    noti1 = Notification
              .where(user_id: current_user.id).where(read: false).order(created_at: :desc)
    noti2 = Notification
              .where(user_id: current_user.id).where(read: true, created_at: (7.days.ago)..(Time.now)).order(created_at: :desc)
    @notifications = noti1 + noti2
  end
end
