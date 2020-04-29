

class MovieTracker::CLI  
    
    def start 
        welcome
        search_movie
    end

    def welcome
        sleep (1)
        puts "WELCOME!"
        sleep(2)
        puts "Get ready to find a movie!"
    end

    def search_movie
        puts "Enter a movie title to search:"
        title = gets.strip
        MovieTracker::ApiManager.search(title)
      display_movies
    
    end

   
    def display_movies
        MovieTracker::Movie.all.each_with_index do |m,i| 
            puts  "#{i}.#{m.title}" 
        end 
    end 

    def display_single_movie(i)
        m = MovieTracker::Movie.all(i)
        MovieTracker::ApiManager.get_movie_info(m) 
        puts "Results:"
    end 
   

    
    

   

    

end 