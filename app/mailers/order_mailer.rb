class OrderMailer < ApplicationMailer

  def notify_admin_email(admin, id)
    @admin = admin
    @id = id
    mail(to: @admin.email, subject: 'Notification.')
  end

  def purchase_error_email(admin, message)
    @message = message
    mail(to: @admin.email, subject: 'Purchase error.')
  end

  def purchase_email(user, purchase_photo)
    @user = user
    @purchase_photo = purchase_photo
    mail(to: @user.email, subject: 'Your purchase.')
  end
end
