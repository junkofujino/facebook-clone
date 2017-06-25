class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
    #Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
    if params[:notification_id]
      notifications = Notification.where(comment: @comments)
      notifications.update_all(read: true)
      @notifications_count = Notification.where(user_id: current_user).where(read: false).count
    end
    sleep(3)
  end

  def new
      @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
     redirect_to topics_path, notice: "投稿を作成しました！"
    else
     render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topics_params)
     redirect_to topics_path, notice: "投稿を編集しました！"
    else
     render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "投稿を削除しました！"
  end

  private
   def topics_params
     params.require(:topic).permit(:content)
   end

   def set_topic
     @topic = Topic.find(params[:id])
   end
end
