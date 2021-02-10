

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IB outlets
    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var oneJokeButton: UIButton!
    @IBOutlet weak var manyJokesButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    //MARK: - Private properties
    private var oneJoke: OneJoke?
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
        animateButtons()
        setupUIButton()
        fetchOneJoke()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "oneJokeSegue" {
            let oneJokeVC = segue.destination as! OneJokeViewController
            oneJokeVC.oneJokeDetails = oneJoke
        }
    }
    
    //MARK: - Private methods
    private func setupImage() {
        guard let stringURL = DataManager.shared.photos.randomElement() else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        DispatchQueue.main.async {
            self.imgeView.image = UIImage(data: imageData)
        }
    }
    
    //Animation for buttons
    private func animateButtons() {
        
        UIView.animate(withDuration: 4.0) {
            self.oneJokeButton.alpha = 0.0
            self.manyJokesButton.alpha = 0.0
            self.oneJokeButton.alpha = 1.0
            self.manyJokesButton.alpha = 1.0
        }
        
        var frame = self.stackView.frame
        frame.origin.y = 100
        frame.size.height = 200
        
        UIView.animate(withDuration: 1.5, delay: 3.0, options: .curveEaseOut, animations: {
            self.stackView.frame = frame
        }) { (true) in
            print("Done")
        }
    }
    
    private func setupUIButton() {
        oneJokeButton.layer.cornerRadius = 15
        manyJokesButton.layer.cornerRadius = 15
        
    }
    
    private func fetchOneJoke() {
        
        //??
        NetworkManager.shared.fetchOneJoke { oneJoke in
            DispatchQueue.main.async {
                self.oneJoke = oneJoke
            }
        }
    }
    
    
    @IBAction func oneJokeButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func manyJokesButtonPressed(_ sender: UIButton) {
        
    }
}

