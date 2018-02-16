class Goal < ApplicationRecord
  enum focus_area: ["inividual", "team", "community", "professional"]
  enum level: ["expected", "possible", "reach"]

  def self.individual
    where(focus_area: 0)
  end

  def self.team
    where(focus_area: 1)
  end

  def self.community
    where(focus_area: 2)
  end

  def self.professional
    where(focus_area: 3)
  end

  def complete?
    complete
  end

end
