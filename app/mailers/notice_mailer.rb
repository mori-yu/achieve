class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog,user_email)
    @greeting = "Hi"
    
    @blog = blog
    @user_email = user_email

    mail to: @user_email,
         subject: '【Achieve】ブログが投稿されました'
  end
  
  def sendmail_contact(contact)
    @contact = contact

    mail to: @contact.email,
         subject: '【Achieve】お問い合わせありがとうございます'
  end
end
