class Alert < ApplicationRecord
    ALLOWED_TYPES = %w[portal_opened portal_closed]

    before_save :set_default_tag # needed this because of sqlite3
    validates :alert_type, inclusion: { in: ALLOWED_TYPES, message: "%{value} is not a valid alert type" }

    serialize :tag, Array

    private

    def set_default_tag
        self.tag = [] if self.tag.nil?
    end

end
