class Camper
  include Tire::Model::Persistence

  property :title, :analyzer => 'snowball'
  property :created_at, :type => 'date'
  property :updated_at, :type => 'date'
  property :content
  property :tags, :class => [String]

  # If you were using ActiveRecord etc. instead you would include these:
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
end
