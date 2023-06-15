class Reservation < ApplicationRecord
  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time

  belongs_to :user
  belongs_to :package

  private

  def end_time_after_start_time
    return if start_time.blank? || end_time.blank?

    return unless end_time <= start_time

    errors.add(:end_time, 'must be greater than start time.')
  end
end
