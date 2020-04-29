
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

   def update_info(plot, genre, director, actors, runtime)
        @plot = plot 
        @genre = genre 
        @director = director 
        @actors = actors 
        @runtime = runtime
   end 

   
   
   
   
   
   #def self.find_by_title(title)
     #  @@all.detect { |t| t.title == title}
    #end 
     
   

    #def self.find_by_type(type)
     #   @@all.detect { |ty| ty.type == type}
    #end 

   
   
    #def self.find_by_year(year)
     #   @@all.detect { |y| y.year == year}
    #end 

   

    #def self.find_by_rating(imdb)
     #   @@all.detect {|im| im.imdb == imdb}
    #end 
    

  
      

    
end

