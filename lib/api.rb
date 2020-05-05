class MovieTracker::ApiManager 

    

    APIKEY = "5e91b1978fmsh0665edb87a31db6p1de845jsn7c7cceae9e3a"
    
    URL =  "https://movie-database-imdb-alternative.p.rapidapi.com/"



    def self.search(title)
        query = {page: 1, r: "json", s: title}
        headers = {"x-rapidapi-key": APIKEY, "x-rapid-host": 'movie-database-imdb-alternative.p.rapidapi.com'}
        res = HTTParty.get(URL, query: query, headers: headers)
        moviearr = res["Search"]
        MovieTracker::Movie.mass_create_from_api(moviearr)
    end 

    def self.get_movie_info(m)
        query = {page: 1, r: "json", i: m.imdb}
        headers = {"x-rapidapi-key": APIKEY, "x-rapid-host": 'movie-database-imdb-alternative.p.rapidapi.com'}
        res = HTTParty.get(URL, query: query, headers: headers) 
        m.update_info(res["Plot"],res["Genre"],res["Director"],res["Actors"],res["Runtime"])
    
    end

    

end 
