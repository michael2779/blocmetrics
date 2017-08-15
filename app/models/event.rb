class Event < ApplicationRecord
    belongs_to :registered_application, optional: true
end
