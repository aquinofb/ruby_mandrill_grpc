class Event
	include Mongoid::Document

	field :reference_uuid, type: String
  field :event, type: String
  field :mandrill_tpl, type: String
end
