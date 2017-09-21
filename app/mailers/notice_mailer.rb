class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @greeting = "Hi"
    
    @blog = blog

    mail to: "mori-yu@nttpc.co.jp",
         subject: '【Achieve】ブログが投稿されました'
  end
  
  def sendmail_contact(contact)
    @contact = contact

    mail to: "mori-yu@nttpc.co.jp",
         subject: '【Achieve】お問い合わせありがとうございます'
  end
end
