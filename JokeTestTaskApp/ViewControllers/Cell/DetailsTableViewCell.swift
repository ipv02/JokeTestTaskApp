

import UIKit

class DetailsTableViewCell: UITableViewCell {

    //MARK: - IB outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    
    
    //MARK: - Methods
    func configureCell(with manyJoke: ManyJoke) {

        idLabel.text = "Id: \(String(manyJoke.id ?? 0))"
        typeLabel.text = "Type: \(manyJoke.type ?? "")"
        setupLabel.text = "Setup: \(manyJoke.setup ?? "")"
        punchlineLabel.text = "Punchline: \(manyJoke.punchline ?? "")"
    }
}
