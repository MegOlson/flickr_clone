class UserMailer < ApplicationMailer

  def image_comment(user, image)
    @user = user
    @image = image

    mail to: user.email, subject: "Flickr Clone Notification"
  end
  def image_tag(user, image)
    @user = user
    @image = image

    mail to: user.email, subject: "Flickr Clone Notification"
  end
end
