class City <ApplicationRecord
  has_many :venues

  def self.last_created
    order(created_at: :desc)
    # self.upated_at.strftime("%Y-%m-%d")
    # require 'pry';binding.pry
  end

  def count_venues
    self.venues.count
    # require 'pry';binding.pry
  end

end