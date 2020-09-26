//
//  ApiClient.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 20/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation
var save_session_token = ""
var setMessageStatus = ""
var session_token = ""
class APIClient {
    static let key = "?api_key=de05a59a85ef1e7797de8d4a6d343d0e"
    var page_id = 1
    struct Auth {
        static var accountId = 0
        static var requestToken = ""
        static var sessionId = ""
    }
    
    enum EndPoints {
        static let BASE_URL = "https://api.themoviedb.org/3/"
        static let POSTER_URL = "https://image.tmdb.org/t/p/w185_and_h278_bestv2"
        static let BACKDROP_PATH = "https://image.tmdb.org/t/p/w500_and_h282_face/"
        static let PROFILE_URL = "https://image.tmdb.org/t/p/w138_and_h175_face/"
        static let PROFILE_FULL = "https://image.tmdb.org/t/p/w300_and_h450_bestv2/"
        static let apiKeyParam = key
        static let PAGE = "&page"
        
        case getNowPlayingMovie
        case getPopularMovies
        case getTopRatedMovies
        case getDiscoverMovies
        case getUpcomingMovies
        case getMovieDetailsId(Int)
        case getMovieCreditsId(Int)
        case getArtistProfielId(Int)
        case getProfileImages(Int)
        case getArtistMovieCredits(Int)
        case searchMovieResult(String)
        case getFavoriteMovies
        case getMovieVideoId(Int)
        case getMovieImageId(Int)
        case getMovieReview(Int)
        case getRecommendations(Int)
        case getSimilarId(Int)
        case markMovieFavorite
        case markWatchList
        case setRating
        
        // Auth
        case getRequestToken
        case login
        case createSessionId
        case getUserFavoriteMovie(Int)
        case getUserWatchListMovie(Int)
        case getUserProfileData
        
        var stringValue : String {
            switch self {
            case .getNowPlayingMovie: return EndPoints.BASE_URL + "movie/now_playing" + EndPoints.apiKeyParam
            case .getPopularMovies : return EndPoints.BASE_URL + "movie/popular" + EndPoints.apiKeyParam
            case .getTopRatedMovies: return EndPoints.BASE_URL + "movie/top_rated" + EndPoints.apiKeyParam
            case .getDiscoverMovies: return EndPoints.BASE_URL + "discover/movie" + EndPoints.apiKeyParam
            case .getUpcomingMovies: return EndPoints.BASE_URL + "movie/upcoming" + EndPoints.apiKeyParam
            case .getMovieDetailsId(let id) : return EndPoints.BASE_URL + "movie/\(id)" + EndPoints.apiKeyParam
            //            case .getMovieCreditAll : return EndPoints.BASE_URL + "movie/\(id)/credits" + EndPoints.apiKeyParam
            case .getMovieCreditsId(let id) : return  EndPoints.BASE_URL + "movie/\(id)/credits" + EndPoints.apiKeyParam
            case .getArtistProfielId(let id) : return  EndPoints.BASE_URL + "person/\(id)" + EndPoints.apiKeyParam
            case .getProfileImages (let id): return  EndPoints.BASE_URL + "person/\(id)/images" + EndPoints.apiKeyParam
            case .getArtistMovieCredits(let id): return EndPoints.BASE_URL + "person/\(id)/movie_credits" + EndPoints.apiKeyParam
            case .searchMovieResult(let query): return EndPoints.BASE_URL + "search/movie" + EndPoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""))"
                
            // Auth
            case .getRequestToken : return EndPoints.BASE_URL + "authentication/token/new" + EndPoints.apiKeyParam
            case .login : return EndPoints.BASE_URL + "authentication/token/validate_with_login" + EndPoints.apiKeyParam
            case .createSessionId : return EndPoints.BASE_URL + "authentication/session/new" + EndPoints.apiKeyParam
            case .getFavoriteMovies : return EndPoints.BASE_URL + "account/\(Auth.accountId)/favorite/movies" + EndPoints.apiKeyParam + "&session_id=\(Auth.sessionId)" + "&sort_by=created_at.desc"
            case .getMovieVideoId(let id) : return EndPoints.BASE_URL + "movie/\(id)/videos" + EndPoints.apiKeyParam
                
            case .markMovieFavorite: return EndPoints.BASE_URL + "account/\(Auth.accountId)/favorite" + EndPoints.apiKeyParam + "&session_id=\(save_session_token )"
                
            case .markWatchList: return EndPoints.BASE_URL + "account/\(Auth.accountId)/watchlist" + EndPoints.apiKeyParam + "&session_id=\(save_session_token )"
                
            case .setRating: return EndPoints.BASE_URL + "account/\(Auth.accountId)/rating" + EndPoints.apiKeyParam + "&session_id=\(save_session_token )"
            //
            case .getMovieImageId(let id) : return EndPoints.BASE_URL + "movie/\(id)/images" + EndPoints.apiKeyParam
            case .getMovieReview(let id) : return EndPoints.BASE_URL + "movie/\(id)/reviews" + EndPoints.apiKeyParam + "&page=\(1)"
            case .getRecommendations(let id) : return EndPoints.BASE_URL + "movie/\(id)/recommendations" + EndPoints.apiKeyParam
            case .getSimilarId(let id) : return EndPoints.BASE_URL + "movie/\(id)/similar" + EndPoints.apiKeyParam
                //
                
            // account
            case .getUserFavoriteMovie(let id) : return EndPoints.BASE_URL +  "account/\(id)/favorite/movies" + EndPoints.apiKeyParam + "&session_id=\(save_session_token )"
                
            case .getUserWatchListMovie(let id) : return EndPoints.BASE_URL +  "account/\(id)/watchlist/movies" + EndPoints.apiKeyParam + "&session_id=\(save_session_token )"
                
                
            case .getUserProfileData:  return EndPoints.BASE_URL +  "account" + EndPoints.apiKeyParam + "&session_id=\(save_session_token )"
                
            }
            // account/278/favorite/movies?api_key=de05a59a85ef1e7797de8d4a6d343d0e&session_id=b16c44eab94c78513d62946a881a3be71760b7d9&language=en-US&sort_by=created_at.desc&page=1
        }
        var url : URL {
            return URL(string: stringValue)!
        }
    }
    
    class func taskForPOSTRequest<RequestType:Encodable, ResponseType: Decodable> (url: URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping(ResponseType?, Error?)-> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil , error)
                }
                return
            }
            let decoder =  JSONDecoder()
            do {
                let requestObject = try decoder.decode(ResponseType.self, from: data)
                
                DispatchQueue.main.async {
                    completion(requestObject , nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(nil , error)
                }
            }
        }
        task.resume()
    }
    
    // @GET REQUEST
    class func taskForGETRequest<ResponseType: Decodable>(url : URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?)-> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                completion(responseObject, nil)
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            } catch {
                DispatchQueue.main.sync {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    class func login(username: String, password: String, completion: @escaping(Bool, Error?)-> Void){
        
        let body = LoginRequest(username: username, password: password, requestToken: Auth.requestToken)
        taskForPOSTRequest(url: EndPoints.login.url, responseType: RequesTokenResponse.self, body: body) { (response, error) in
            if let response = response {
                Auth.requestToken = response.requestToken
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }
    
    
    class func createSessionId(completion: @escaping(Bool, Error?)-> Void) {
        let body = PostSession(requestToken: Auth.requestToken)
        taskForPOSTRequest(url: EndPoints.createSessionId.url, responseType: SessionResponse.self, body: body) { (response, error) in
            if let response = response {
                Auth.sessionId = response.sessionId
                session_token = response.sessionId
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }
    
    class func getRequestToken (completion: @escaping(Bool, Error?)-> Void) {
        let task = URLSession.shared.dataTask(with: EndPoints.getRequestToken.url) { (data, response, error) in
            guard let data = data else {
                completion(false, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(RequesTokenResponse.self, from: data)
                Auth.requestToken = responseObject.requestToken
                completion(true, nil)
            } catch {
                completion(true, nil)
            }
            
        }
        task.resume()
    }
    
    class func getUpcomingMovies(completion: @escaping([Result]?, Error?)-> Void) {
           // print(EndPoints.getNowPlayingMovie.url)
           taskForGETRequest(url: EndPoints.getUpcomingMovies.url, response: Movie.self) { (response, error) in
               if let response = response {
                completion(response.results, nil)
               } else {
                   completion([], error)
                   print(error.debugDescription)
               }
           }
       }
    
    
    //@GET NOW PLAYING MOVIE LIST
    class func getNowPlayingMovieList(completion: @escaping([NowPlayingMovie]?, Error?)-> Void) {
        // print(EndPoints.getNowPlayingMovie.url)
        taskForGETRequest(url: EndPoints.getNowPlayingMovie.url, response: NowPlayingMovie.self) { (response, error) in
            if let response = response {
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
            }
        }
    }
    
    //@GET POPULAR MOVIE
    class func getPopularMovieList(completion: @escaping([Movie]?, Error?)-> Void) {
        print(EndPoints.getPopularMovies.url)
        taskForGETRequest(url: EndPoints.getPopularMovies.url, response: Movie.self) { (response, error) in
            if let response = response {
                //  print(response)
                completion([response], nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    //@GET TOP RATED MOVIE
    class func getTopRatedMovieList(completion: @escaping([Movie]?, Error?)-> Void) {
        //print(EndPoints.getTopRatedMovies.url)
        taskForGETRequest(url: EndPoints.getTopRatedMovies.url, response: Movie.self) { (response, error) in
            if let response = response {
                //  print("topMovi\([response.results])")
                completion([response], nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    //@GET DISCOVER MOVIE
    class func getDiscoverMovieList(completion: @escaping([Result]?, Error?)-> Void) {
        //print(EndPoints.getTopRatedMovies.url)
        taskForGETRequest(url: EndPoints.getDiscoverMovies.url, response: Discover.self) { (response, error) in
            if let response = response {
                //  print("topMovi\([response.results])")
                completion(response.results, nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    
    //@GET: ID MOVIES DETAILS
    class func getMovieId(id: Int, completion: @escaping(MovieDetails?, Error?)-> Void){
        taskForGETRequest(url: EndPoints.getMovieDetailsId(id).url, response: MovieDetails.self) { (response, error) in
            if let response = response {
                //                print("",response)
                completion(response, nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    //@GET: ID MOVIES credits
    class func getMovieCreditsId(id: Int, completion: @escaping([MovieCcredits]?, Error?)-> Void){
        print( EndPoints.getMovieCreditsId(id).url)
        taskForGETRequest(url: EndPoints.getMovieCreditsId(id).url, response: MovieCcredits.self) { (response, error) in
            if let response = response {
                print("response:\(response)")
                completion([response], nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    //@GET: PERSION ID
    class func getArtistProfileId(id: Int, completion: @escaping(Artist?, Error?)-> Void){
        taskForGETRequest(url: EndPoints.getArtistProfielId(id).url, response: Artist.self) { (response, error) in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    
    //@GET: ID MOVIES credits
    class func getPersonImageId(id: Int, completion: @escaping([Profile]?, Error?)-> Void){
        taskForGETRequest(url: EndPoints.getProfileImages(id).url, response: Profile.self) { (response, error) in
            if let response = response {
                // print("res\(response)")
                completion([response], nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    //@GET: Artist MOVIE LIST CREDITS
    class func getPersonMovieCreditsId(id: Int, completion: @escaping([PersonMovieCredit]?, Error?)-> Void){
        taskForGETRequest(url: EndPoints.getArtistMovieCredits(id).url, response: PersonMovieCredit.self) { (response, error) in
            if let response = response {
                // print("res: \(response)")
                completion([response], nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    
    // Search Result
    class func searchMovie(query: String, completion: @escaping([Movie]?, Error?)-> Void){
        taskForGETRequest(url: EndPoints.searchMovieResult(query).url, response: Movie.self) { (response, error) in
            if let response = response {
                // print("search:\(response)")
                completion([response], nil)
            } else {
                completion(nil, error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    // @ MARK FAVORITE MOVIE
    class func getFavoriteMovie(completion: @escaping([Movie]?, Error?)->Void) {
        print(EndPoints.getFavoriteMovies.url)
        taskForGETRequest(url: EndPoints.getFavoriteMovies.url, response: Movie.self) { (response, error) in
            if let response = response {
                print(response)
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    
    class func markFavorite(movieId: Int, favorite: Bool, completion: @escaping(Bool, Error?)->Void) {
        let body = MarkFavorite(mediaType: "movie", mediaId: movieId, favorite: favorite)
        print("FAV: \(EndPoints.markMovieFavorite.url)")
        taskForPOSTRequest(url: EndPoints.markMovieFavorite.url, responseType: MarkFavoriteResponse.self, body: body) { (response, error) in
            if let response = response {
                print(response)
                
                setMessageStatus = response.statusMessage
                completion(response.statusCode == 1 || response.statusCode == 12 || response.statusCode == 13, nil)
            } else {
                completion(false, nil)
            }
        }
    }
    class func markWatcMovie(movieId: Int, watchList: Bool, completion: @escaping(Bool, Error?)->Void) {
        let body =  MarkWatchMovieList(mediaType: "movie", mediaId: movieId, watchlist: watchList)
        print("FAV: \(EndPoints.markWatchList.url)")
        taskForPOSTRequest(url: EndPoints.markWatchList.url, responseType: MarkFavoriteResponse.self, body: body) { (response, error) in
            if let response = response {
                print(response)
                
                setMessageStatus = response.statusMessage
                completion(response.statusCode == 1 || response.statusCode == 12 || response.statusCode == 13, nil)
            } else {
                completion(false, nil)
            }
        }
    }
    
    class func setRatingMovie(movieId: Int, value: Double, completion: @escaping(Bool, Error?)->Void) {
        //           let body =  MarkWatchMovieList(mediaType: "movie", mediaId: movieId, watchlist: watchList)
        let body = RatingMovie(value: value)
        print("FAV: \(EndPoints.setRating.url)")
        taskForPOSTRequest(url: EndPoints.setRating.url, responseType: MarkFavoriteResponse.self, body: body) { (response, error) in
            if let response = response {
                print(response)
                
                setMessageStatus = response.statusMessage
                completion(response.statusCode == 1 || response.statusCode == 12 || response.statusCode == 13, nil)
            } else {
                completion(false, nil)
            }
        }
    }
    
    
    
    
    class func getMovieVideoId(id: Int, completion: @escaping([Video]?, Error?)->Void) {
        print(EndPoints.getMovieVideoId(420818).url)
        taskForGETRequest(url: EndPoints.getMovieVideoId(id).url, response: Video.self) { (response, error) in
            if let response = response {
                print(response)
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    class func getMovieImageId(id: Int, completion: @escaping([MovieImageList]?, Error?)->Void) {
        print(EndPoints.getMovieImageId(id))
        taskForGETRequest(url: EndPoints.getMovieImageId(id).url, response: MovieImageList.self) { (response, error) in
            if let response = response {
                print(response)
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    class func getMovieReviewId(page:Int, id: Int, completion: @escaping([MovieReview]?, Error?)->Void) {
        print(EndPoints.getMovieReview(id))
        taskForGETRequest(url: EndPoints.getMovieReview(id).url, response: MovieReview.self) { (response, error) in
            if let response = response {
                print(response)
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    class func getMovieRecommandationId(id: Int, completion: @escaping([Movie]?, Error?)->Void) {
        print(EndPoints.getMovieReview(id))
        taskForGETRequest(url: EndPoints.getRecommendations(id).url, response: Movie.self) { (response, error) in
            if let response = response {
                print(response)
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    class func getMovieSimilarId(id: Int, completion: @escaping([Movie]?, Error?)->Void) {
        print(EndPoints.getSimilarId(id))
        taskForGETRequest(url: EndPoints.getSimilarId(id).url, response: Movie.self) { (response, error) in
            if let response = response {
                print(response)
                completion([response], nil)
            } else {
                completion([], error)
                print(error.debugDescription)
                print(error?.localizedDescription ?? "")
            }
        }
    }
    //
    
    
    class func getFavoriteMovieList(id: Int? = nil,  completion: @escaping([Movie]?, Error?)-> Void){
        taskForGETRequest(url: EndPoints.getUserFavoriteMovie(id ?? 0).url, response: Movie.self) { (response, error) in
              if let response = response {
                  // print("search:\(response)")
                  completion([response], nil)
              } else {
                  completion(nil, error)
                  print(error.debugDescription)
                  print(error?.localizedDescription ?? "")
              }
          }
      }
    
    class func getFavoriteWatchList(id: Int? = nil,  completion: @escaping([Movie]?, Error?)-> Void){
           taskForGETRequest(url: EndPoints.getUserWatchListMovie(id ?? 0).url, response: Movie.self) { (response, error) in
                 if let response = response {
                     // print("search:\(response)")
                     completion([response], nil)
                 } else {
                     completion(nil, error)
                     print(error.debugDescription)
                     print(error?.localizedDescription ?? "")
                 }
             }
     }
    
    class func getUserProfileData(completion: @escaping(UserModel?, Error?)->Void) {
         print(EndPoints.getUserProfileData.url)
         taskForGETRequest(url: EndPoints.getUserProfileData.url, response: UserModel.self) { (response, error) in
             if let response = response {
                 print(response)
                 completion(response, nil)
             } else {
                 completion(response, error)
                 print(error.debugDescription)
                 print(error?.localizedDescription ?? "")
             }
         }
     }
    
    
}
