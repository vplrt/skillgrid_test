# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def purchase_email_preview
    OrderMailer.purchase_email(User.first, "http://placehold.it/600/24f355")
  end

  def notify_admin_email_preview
    OrderMailer.notify_admin_email(Admin.first, "201")
  end

  def purchase_error_email_preview
    OrderMailer.purchase_email(Admin.first, "aaa")
  end
end
