module Concerns::Findable
  def self.find_by_name(name)
    @@all.find { |object| object.name == name }
  end
end
