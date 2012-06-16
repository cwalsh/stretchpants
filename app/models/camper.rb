class Camper
  include Tire::Model::Persistence

  property :name, :analyzer => 'snowball'
  property :twitter
  property :city
  property :bio
  property :drink_count
  property :tags, :type => 'array'

  def id
    name
  end
  
  def tags=(tags)
    return if tags.nil?
    tags = tags.gsub!(/,/," ").split if tags.is_a? String
    self.attributes[:tags] = tags
  end

  # If you were using ActiveRecord etc. instead you would include these:
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
end
