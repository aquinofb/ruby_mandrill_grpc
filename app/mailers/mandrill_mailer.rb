require 'mandrill'

class MandrillMailer
  class << self
    def send_email(opts = {})
      mandrill = Mandrill::API.new(ENV.fetch('MANDRILL_API_KEY'))
      mandrill_settings = settings(opts)
      mandrill.messages.send_template(opts.fetch(:template, ''), [], mandrill_settings)
    end

    def settings(opts)
      from = opts.fetch(:from)
      template_vars = opts.fetch(:template_vars, {})
      {
        headers: { 'Reply-To': from.fetch(:email) },
        from_email: from.fetch(:email),
        from_name:  from.fetch(:name),
        to: [{ email: opts.fetch(:to) }],
        subject: opts.fetch(:subject),
        merge_vars: [{
          rcpt: opts.fetch(:to),
          vars: extract_merge_vars(template_vars)
        }],
        attachments: opts.fetch(:attachments, [])
      }
    end

    def extract_merge_vars(params)
      params.map do |key, value|
        { name: key, content: value }
      end
    end
  end
end
