class MessagesService < DynamicMailer::Messages::Service
  def send_it(message, _unused_call)
    event = find_event(message)

    status =
      if !!event
        SendEmailJob.perform_async
        200
      else
        404
      end

    DynamicMailer::Response.new(status: status)
  end

  private

  def find_event(message)
    Event.find_by(
      name: message.event,
      reference_uuid: message.reference_uuid
    )
  end
end
