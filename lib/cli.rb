

class MovieTracker::CLI  
    
    def start 
        welcome
        search_movie
    end

    def search_movie
        puts "Enter a movie title to search:"
        title = gets.strip
        MovieTracker::ApiManager.search(title)
      display_movies
    end
    
    def display_movies
        MovieTracker::Movie.all.each_with_index do |m,i| 
            puts  #{i}.#{m.title} 
            print "HERE ARE YOUR RESULTS!"
        end 
    end 

    def welcome
        puts "WELCOME!"
        puts "Get ready to find a movie!"
    end


    

   

    

end 