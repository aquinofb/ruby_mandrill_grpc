class Event
  def present?
    true
  end

  class << self
    def find_by(**args)
      new
    end
  end
end
