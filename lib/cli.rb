

class MovieTracker::CLI  
    
    def start 
        welcome
        loop do 
            search_movie
            display_movies
            puts ""
            puts "Type a number from which movie you want to see"
            loop do 
             choice = gets.strip.downcase
              if choice == "exit"
                puts  "-------------" 
                puts "|    BYE!    |"
                puts  "-------------"
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
                    puts "Oops! Something went wrong!"
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
           puts  "-------------" 
           puts "|    BYE!    |"
           puts  "-------------"
           exit 
        end 
        MovieTracker::ApiManager.search(title)
    end

    
     def valid?(input)
       return input.to_i.between?(1, MovieTracker::Movie.all.length)
    end 
   
    def display_movies
        MovieTracker::Movie.all.each_with_index do |m,i|  
            puts  "#{i+1}.#{m.title}" 
        end 
    end 

    def display_single_movie(i)
        m = MovieTracker::Movie.all[i-1]
        MovieTracker::ApiManager.get_movie_info(m) 
        puts "Title:   #{m.title}"
        puts ""
        puts "Plot:   #{m.plot}"
        puts ""
        puts "Genres:   #{m.genres}" 
        puts ""
        puts "Director: #{m.director}" 
        puts ""
        puts "Actors:  #{m.actors}" 
        puts ""
        puts "Runtime:  #{m.runtime}" 
     end 
   
       

end 