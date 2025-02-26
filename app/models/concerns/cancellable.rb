module Cancellable
  extend ActiveSupport::Concern

  included do #any scopes or validations/callbacks will be in do loops for modules
    scope :is_cancelled, -> { where(cancelled: true) }
    scope :active, -> { where(cancelled: false) }

    before_update :set_cancelled_at, if: :will_save_change_to_cancelled?
  end

  def cancel! #methods and columns need to be present in schema if want to work
    update!(cancelled: true)
    cancelled_at = Time.current
  end

  def uncancel! #to undo cancel
    update!(cancelled: false)
    cancelled_at = nil
    uncancelled_at = Time.current
  end

  private
  def set_cancelled_at
    self.cancelled_at = Time.current if cancelled
  end
end