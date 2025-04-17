class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

  def age_in_days
    @age_in_days.to_f / 365
  end
end
