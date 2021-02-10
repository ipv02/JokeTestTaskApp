

import Foundation


class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    
    func fetchJokes() -> [ManyJoke] {
        guard let data = UserDefaults.standard.object(forKey: "joke") as? Data else { return [] }
        guard let jokes = try? JSONDecoder().decode([ManyJoke].self, from: data) else { return [] }
        return jokes
    }
    
    func saveJokes(with jokes: [ManyJoke]) {
        var jokes = fetchJokes()
        jokes.append(contentsOf: jokes)
        guard let data = try? JSONEncoder().encode(jokes) else { return }
        UserDefaults.standard.set(data, forKey: "joke")
    }
}
