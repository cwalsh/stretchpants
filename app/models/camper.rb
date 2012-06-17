class Camper
  include Tire::Model::Persistence

  property :name, :analyzer => 'snowball'
  property :twitter
  property :city
  property :bio
  property :drink_count, :class => Integer, :default => 0
  property :tags, :analyzer => 'keyword', :type => [String]

  def id
    name.blank? ? nil : name.gsub(/ /,"_").downcase
  end

  # If you were using ActiveRecord etc. instead you would include these:
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
end
