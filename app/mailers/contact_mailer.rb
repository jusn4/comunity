class ContactMailer < ApplicationMailer
  def send_mail(mail_title,mail_contact,group_users)
    @mail_title = mail_title
    @mail_contact = mail_contact
    mail bcc: group_users.pluck(:email), subject: mail_title
  end
end
