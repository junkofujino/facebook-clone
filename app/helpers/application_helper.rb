module ApplicationHelper
  def profile_img(user,page='others')
    return image_tag(user.avatar, alt: user.name, class:'img1') if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end

    if page == 'topics'
     image_tag(img_url, alt: user.name, class:'img1')
    else
     image_tag(img_url, alt: user.name, class:'img1')
    end
  end

  def topic_img(topic)
   return image_tag(topic.avatar, alt: topic.id) if topic.avatar?
  end

end
