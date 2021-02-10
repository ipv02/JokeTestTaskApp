

import UIKit

class OneJokeViewController: UIViewController {

    //MARK: - IB outlets
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    //MARK: - Properties
    var oneJokeDetails: OneJoke!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = 15
        popUpView.layer.cornerRadius = 15

        setupLabels()
        
    }
    
    //MARK: - Private methods
    private func setupLabels() {
        idLabel.text = "Id: \(String(oneJokeDetails.id ?? 0))"
        typeLabel.text = "Type: \(oneJokeDetails.type ?? "")"
        setupLabel.text = "Setup: \(oneJokeDetails.setup ?? "")"
        punchlineLabel.text = "Punchline: \(oneJokeDetails.punchline ?? "")"
    }

    //MARK: - IB action
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
