class Ticket < ApplicationRecord
    has_many :ticket_lines

    def as_json(**options)
      unless options.has_key? :include
        options.merge!(include: [:ticket_lines])
      end
      super(options)
    end
end
