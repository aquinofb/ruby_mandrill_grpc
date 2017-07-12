class SendEmailJob
  include Sidekiq::Worker

  def perform
    DynamicMailer::Mandrill.send_email(
      from: {
        email: 'admin@babylontech.co.uk',
        name: '[Babylon Health] Dynamic Mailer'
      },
      to: 'aquinofb@gmail.com',
      template: 'default_template',
      subject: 'Email from Dynamic Mailer',
      template_vars: {},
      attachments: []
    )
  end
end
