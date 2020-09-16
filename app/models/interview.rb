class Interview < ApplicationRecord
  belongs_to :candidate

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_after_start
  validate :conflicts

  private
    def end_after_start
      return if end_date.blank? || start_date.blank? || start_time.blank? || end_time.blank?

      if end_date < start_date
        errors.add(:end_date, "must be after start date")
      else
        if end_date = start_date && end_time < start_time
          errors.add(:end_time, "must me after start time")
        end
      end
    end

    def conflicts
      return if end_date.blank? || start_date.blank? || start_time.blank? || end_time.blank?
      
      current_start = (start_date).to_time.to_i + start_time.to_i
      current_end = end_date.to_time.to_i + end_time.to_i

      schedules = Interview.where(:candidate_id => candidate_id)
  
      schedules.each do |schedule|
        schedule_start = schedule.start_date.to_time.to_i + schedule.start_time.to_i
        schedule_end = schedule.end_date.to_time.to_i + schedule.end_time.to_i

        if (current_start >= schedule_start && current_start <= schedule_end) || ((current_end >= schedule_start && current_end <= schedule_end))
          errors.add(:start_time, "conflicts " + schedule.id.to_s)
        end
      end
    end
end
