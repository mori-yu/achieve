class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog,user)
    @greeting = "Hi"
    
    @blog = blog
    @user = user

    mail to: @user.email,
         subject: '【Achieve】ブログが投稿されました'
  end
  
  def sendmail_contact(contact)
    @contact = contact

    mail to: @contact.email,
         subject: '【Achieve】お問い合わせありがとうございます'
  end
end
