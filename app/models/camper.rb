class Camper
  include Tire::Model::Persistence

  property :name, :analyzer => 'keyword', :type => :string
  property :twitter, :type => :string
  property :city, :type => :string
  property :bio, :type => :string
  property :drink_count, :class => Integer, :default => 0, :type => :integer
  property :tags, :analyzer => 'keyword', :class => [String], :type => :string

  def id
    name.blank? ? nil : name.gsub(/ /,"_").downcase
  end

  def self.full_search(search_query, params)
    search do |search|
      search.query do |query|
        query.string search_query
      end

      search.sort do |sort|
        sort.by :name, 'asc'
     end

      unless params[:tags].blank?
        search.filter :term, :tags => params[:tags]
      end

      search.facet 'tags', :global => true do
        terms :tags
      end
    end
  end

  # If you were using ActiveRecord etc. instead you would include these:
  #include Tire::Model::Search
  #include Tire::Model::Callbacks
end
