class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(topic_id: params[:topic_id])
    @topic = @like.topic
    @likes = Like.where(topic_id: params[:topic_id])
    respond_to do |format|
      if @like.save
        format.html { redirect_to topic_path(@topic), notice: 'いいね！しました。'}
        format.js { render :create }
      else
        format.html { render :show }
      end
    end

  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @topic = @like.topic
    @likes = Like.where(topic_id: params[:topic_id])
    respond_to do |format|
      if @like.destroy
        format.html { redirect_to topic_path(@topic), notice: 'いいね！を削除しました。'}
        format.js { render :destroy }
      else
        format.html { render :show }
      end
    end

  end

end
