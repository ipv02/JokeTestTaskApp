

import UIKit

class ManyJokesTableViewController: UITableViewController {
    
    //MARK: - Private properties
    private var manyJokes: [ManyJoke] = []
    private var isLoading = false
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 200
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        let tableViewLoadingCellNib = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        self.tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadCell")
        
        fetchJokes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        StorageManager.shared.saveJokes(with: manyJokes)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return manyJokes.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
            let jokes = manyJokes[indexPath.row]
            cell.configureCell(with: jokes)
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadCell", for: indexPath) as! LoadingTableViewCell
            if isLoading {
                cell.activityIndicator.startAnimating()
            } else {
                cell.activityIndicator.stopAnimating()
                cell.activityIndicator.hidesWhenStopped = true
            }
            return cell
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else {
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
            loadMoreData()
        }
    }
    
    //MARK: - Private methods
    private func loadMoreData() {
        if !self.isLoading {
            self.isLoading = false
            DispatchQueue.main.async {
                self.fetchJokes()
                self.isLoading = true
            }
        }
    }
    
    private func fetchJokes() {
        NetworkManager.shared.fetchManyJokes { manyJokes in
            self.manyJokes = manyJokes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

