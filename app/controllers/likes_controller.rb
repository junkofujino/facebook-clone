class LikesController < ApplicationController

  def create
    @like = current_user.likes.build(topic_id: params[:topic_id])
    @topic = @like.topic
    @likes = @topic.likes
    respond_to do |format|
      if @like.save
        format.js { render :create }
      else
        format.html { render :like }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @topic = @like.topic
    @likes = @topic.likes
    respond_to do |format|
      if @like.destroy
        format.js { render :destroy }
      else
        format.html { render :like }
      end
    end
  end

end
