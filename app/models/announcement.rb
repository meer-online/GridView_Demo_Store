class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at

  def self.current_announcements(hide_time)
    #with_scope :find => { :conditions => "starts_at <= 'now' AND ends_at >= 'now'" } do
      if hide_time.nil?
        Announcement.find(:all)
      else
        Announcement.find(:all, :conditions => ["updated_at > ? OR starts_at > ?", hide_time, hide_time])
      end
    #end
  end
end
