class Notifier < ApplicationMailer

	default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  def welcome(recipient)
    @account = recipient
    mail(to: recipient.email_address_with_name,
         bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
  end

end
