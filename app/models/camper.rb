class Camper
  include Tire::Model::Persistence

  property :title, :analyzer => 'snowball'
  property :created_at, :type => 'date'
  property :updated_at, :type => 'date'
  property :content
  property :tags, :type => 'array'

  before_save :timestamps

  def id
    title
  end
  
  def tags=(tags)
    return if tags.nil?
    t=self.attributes[:tags] = tags.gsub(/,/," ").split
  end

  def timestamps
    self.updated_at = Time.now
    self.created_at ||= Time.now
  end

  # If you were using ActiveRecord etc. instead you would include these:
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
end
