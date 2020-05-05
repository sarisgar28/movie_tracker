
class MovieTracker::Movie

    attr_accessor :title, :type, :year, :imdb, :plot, :genres, :director, :actors, :runtime

    @@all = [ ]

    def self.mass_create_from_api(moviearr)
        moviearr.each do |moviehash| 
            new(moviehash["Title"], moviehash["Type"], moviehash["Year"], moviehash["imdbID"])
        end
    end 

    def initialize(title, type, year, imdb)
        @title = title 
        @type = type 
        @year = year 
        @imdb = imdb
        save 
    end 
    
    def self.all 
        @@all 
    end 
    
    def save
        @@all << self 
    end 

   def update_info(plot, genres, director, actors, runtime)
        @plot = plot 
        @genres = genres
        @director = director 
        @actors = actors
        @runtime = runtime
   end 

   
   
end

