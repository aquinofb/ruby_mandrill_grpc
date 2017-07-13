class SendEmailJob
  include Sidekiq::Worker

  def perform(event_id, email)
    event = Event.find(event_id)
    MandrillMailer.send_email(
      from: {
        email: 'admin@babylontech.co.uk',
        name: '[Babylon Health] Dynamic Mailer'
      },
      to: email,
      template: event.mandrill_tpl,
      subject: 'Email from Dynamic Mailer',
      template_vars: {},
      attachments: []
    )
  end
end
