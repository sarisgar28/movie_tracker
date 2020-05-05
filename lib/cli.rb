

class MovieTracker::CLI  
    
    def start 
        welcome
        loop do 
            search_movie
            display_movies
            loop do 
             choice = gets.strip.downcase
             if choice == "exit"
                puts "Bye!"
                return 
             end 
             choice = choice.to_i 
             if valid?(choice)
                display_single_movie(choice)
                puts "When you are done click Enter"
                gets 
                MovieTracker::Movie.all.clear
                break
             else   
                puts "Oop! Try again"
                next 
             end 
            end 
        end 
     end

    def welcome
        sleep (1)
        puts  "------------------------------------"
        puts  "|                                   |"
        puts  "|     WELCOME TO MOVIE TRACKER!     |"
        puts  "|                                   |"
        puts  "-------------------------------------"
        sleep(2)
        puts "Get ready to find a movie!"
    end

    def search_movie
        puts "Enter a movie title to search or type exit"
        title = gets.strip
        if title == "exit"
         exit 
        end 
        MovieTracker::ApiManager.search(title)
    end

    
     def valid?(input)
       return input.to_i.between?(1, MovieTracker::Movie.all.length)
    end 
   
    def display_movies
        MovieTracker::Movie.all.each_with_index do |m,i| 
            puts  "#{i}.#{m.title}" 
        end 
    end 

    def display_single_movie(i)
        m = MovieTracker::Movie.all[i]
        MovieTracker::ApiManager.get_movie_info(m) 
        puts "Plot:   #{m.plot}"
        puts "Genres:   #{m.genres}" 
        puts "Director: #{m.director}" 
        puts "Actors:  #{m.actors}" 
        puts "Runtime:  #{m.runtime}" 
        
    end 
   
       

end 