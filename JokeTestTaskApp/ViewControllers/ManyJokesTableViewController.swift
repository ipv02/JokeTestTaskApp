

import UIKit

class ManyJokesTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var manyJokes: [ManyJoke] = []
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 200
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        NetworkManager.shared.fetchManyJokes { manyJokes in
            self.manyJokes = manyJokes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manyJokes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
        
        let manyJoke = manyJokes[indexPath.row]
        cell.configureCell(with: manyJoke)
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - IB action
    @IBAction func refreshControl(_ sender: UIRefreshControl) {
        NetworkManager.shared.fetchManyJokes { manyJokes in
            self.manyJokes = manyJokes
            self.manyJokes.append(contentsOf: manyJokes)
            DispatchQueue.main.async {
                sender.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
}
