

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let jokesURL = "https://official-joke-api.appspot.com/jokes/ten"
    private let jokeURL = "https://official-joke-api.appspot.com/jokes/random"
    
    func fetchManyJokes(completion: @escaping ([ManyJoke]) -> Void) {
        guard let url = URL(string: jokesURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            
            guard let data = data else { return }
            
            do {
                let jokes = try JSONDecoder().decode([ManyJoke].self, from: data)
                completion(jokes)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    //Duplicate code, need to use generics
    func fetchOneJoke(completion: @escaping (OneJoke) -> Void) {
        guard let url = URL(string: jokeURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            
            guard let data = data else { return }
            
            do {
                let joke = try JSONDecoder().decode(OneJoke.self, from: data)
                completion(joke)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
