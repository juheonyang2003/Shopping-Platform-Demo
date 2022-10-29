//
//  ForthViewController.swift
//  AP Project
//
//

import UIKit

var highScore = 0

class ForthViewController: UIViewController {
    //records what the player is doing in order to run the game.
    @IBOutlet weak var homeButton: UIButton!
    
    @IBAction func homeButtonFunc(_ sender: Any) {
      
    }
    
    
    var previousImageView = [UIImageView]()
    var previousButton = [UIButton]()
    var tabCount = 0
    var successCount = 0
    
    
    func buttonTabbed() {
        if tabCount % 2 == 0 && previousButton.count != 0{
            if previousImageView[0].image != previousImageView[1].image{
                for i in previousButton{
                    i.isHidden = false
                }
                for i in previousImageView{
                    i.isHidden = true
                }
            }
            previousImageView = []
            previousButton = []
        }
        tabCount += 1
    }
    //All components on screen including imageviews and buttons that are used in the game state.
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var button11: UIButton!
    @IBAction func action11(_ sender: Any) {
        buttonTabbed()
        image11.isHidden = false
        button11.isHidden = true
        previousImageView.append(image11)
        previousButton.append(button11)
        
    }
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var button12: UIButton!
    @IBAction func action12(_ sender: Any) {
        buttonTabbed()
        image12.isHidden = false
        button12.isHidden = true
        previousImageView.append(image12)
        previousButton.append(button12)
    }
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var button13: UIButton!
    @IBAction func action13(_ sender: Any) {
        buttonTabbed()
        image13.isHidden = false
        button13.isHidden = true
        previousImageView.append(image13)
        previousButton.append(button13)
    }
    @IBOutlet weak var image21: UIImageView!
    @IBOutlet weak var button21: UIButton!
    @IBAction func action21(_ sender: Any) {
        buttonTabbed()
        image21.isHidden = false
        button21.isHidden = true
        previousImageView.append(image21)
        previousButton.append(button21)
    }
    @IBOutlet weak var image22: UIImageView!
    @IBOutlet weak var button22: UIButton!
    @IBAction func action22(_ sender: Any) {
        buttonTabbed()
        image22.isHidden = false
        button22.isHidden = true
        previousImageView.append(image22)
        previousButton.append(button22)
    }
    @IBOutlet weak var image23: UIImageView!
    @IBOutlet weak var button23: UIButton!
    @IBAction func action23(_ sender: Any) {
        buttonTabbed()
        image23.isHidden = false
        button23.isHidden = true
        previousImageView.append(image23)
        previousButton.append(button23)
    }
    @IBOutlet weak var image31: UIImageView!
    @IBOutlet weak var button31: UIButton!
    @IBAction func action31(_ sender: Any) {
        buttonTabbed()
        image31.isHidden = false
        button31.isHidden = true
        previousImageView.append(image31)
        previousButton.append(button31)
    }
    @IBOutlet weak var image32: UIImageView!
    @IBOutlet weak var button32: UIButton!
    @IBAction func action32(_ sender: Any) {
        buttonTabbed()
        image32.isHidden = false
        button32.isHidden = true
        previousImageView.append(image32)
        previousButton.append(button32)
    }
    @IBOutlet weak var image33: UIImageView!
    @IBOutlet weak var button33: UIButton!
    @IBAction func action33(_ sender: Any) {
        buttonTabbed()
        image33.isHidden = false
        button33.isHidden = true
        previousImageView.append(image33)
        previousButton.append(button33)
    }
    @IBOutlet weak var image41: UIImageView!
    @IBOutlet weak var button41: UIButton!
    @IBAction func action41(_ sender: Any) {
        buttonTabbed()
        image41.isHidden = false
        button41.isHidden = true
        previousImageView.append(image41)
        previousButton.append(button41)
    }
    @IBOutlet weak var image42: UIImageView!
    @IBOutlet weak var button42: UIButton!
    @IBAction func action42(_ sender: Any) {
        buttonTabbed()
        image42.isHidden = false
        button42.isHidden = true
        previousImageView.append(image42)
        previousButton.append(button42)
    }
    @IBOutlet weak var image43: UIImageView!
    @IBOutlet weak var button43: UIButton!
    @IBAction func action43(_ sender: Any) {
        buttonTabbed()
        image43.isHidden = false
        button43.isHidden = true
        previousImageView.append(image43)
        previousButton.append(button43)
    }
    
    //Back and Score button
    @IBOutlet weak var backOutlet: UIButton!
    @IBAction func backAction(_ sender: Any) {
        updateApp(on: .start)
    }
    @IBOutlet weak var scoreOutlet: UIButton!
    @IBAction func scoreAction(_ sender: Any) {
        displayScoreAlert()
    }
    
    var images: [UIImageView] = []
    var buttons: [UIButton] = []
    
    
    //Objects being used in start state
    
    
    @IBOutlet weak var highscoreRecord: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBAction func getStartedAction(_ sender: Any) {
        
        //Picking 6 random cards from 12 cards.
        //This is the website that I got the images from: https://thenounproject.com/term/cute/


        let icons: [UIImage?] = [UIImage(named: "Image"), UIImage(named: "Image-1"), UIImage(named: "Image-2"), UIImage(named: "Image-3"), UIImage(named: "Image-4"), UIImage(named: "Image-5"), UIImage(named: "Image-6"), UIImage(named: "Image-7"), UIImage(named: "Image-8"), UIImage(named: "Image-9"), UIImage(named: "Image-10"), UIImage(named: "Image-11")]
        let shuffledIcons = icons.shuffled()
        let selectedIcons = [shuffledIcons[0], shuffledIcons[1], shuffledIcons[2], shuffledIcons[3], shuffledIcons[4], shuffledIcons[5],shuffledIcons[0], shuffledIcons[1], shuffledIcons[2], shuffledIcons[3], shuffledIcons[4], shuffledIcons[5]]
        let shuffledSelectedIcons = selectedIcons.shuffled()
        
        //Randomly assigning pairs of pictures to the imageviews onscreen.
        for i in 0...11{
            images[i].image = shuffledSelectedIcons[i]
        }
        
        updateApp(on: .ingame)
    }
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        images.append(contentsOf: [image11, image12, image13, image21, image22, image23, image31, image32, image33, image41, image42, image43])
        buttons.append(contentsOf: [button11, button12, button13, button21, button22, button23, button31, button32, button33, button41, button42, button43])
        
        updateApp(on: .start)
    }

    //states
    enum State {
        case start
        case ingame
    }
    
    //the main function that calls different functions based on the current state
    func updateApp(on state: State){
        //The codes to manage all buttons and all images at the same time.
        for i in images{
            i.isHidden = true
        }
        
        //Leads to functions that manage elements on screen one by one.
        switch state {
        case .start:
            updateStart()
        case .ingame:
            updateIngame()
        }
        
        //reset the progress the user made in game
        previousImageView = []
        previousButton = []
        tabCount = 0
        successCount = 0
    }
    
    //The function that is being called for start state
    func updateStart(){
        getStartedButton.isHidden = false
        backOutlet.isHidden = true
        scoreOutlet.isHidden = true
        highscoreRecord.isHidden = false
        highscoreRecord.text = "High Score: \(highScore)"
        homeButton.isHidden = false
        for i in buttons{
            i.isHidden = true
        }
    }
    
    //The function that is being called for ingame state
    func updateIngame(){
        getStartedButton.isHidden = true
        backOutlet.isHidden = false
        scoreOutlet.isHidden = false
        highscoreRecord.isHidden = true
        homeButton.isHidden = true
        for i in buttons{
            i.isHidden = false
        }
    }
    
    //Alert for showing the score
    func displayScoreAlert() {
        
        successCount = 0
        
        for i in images{
            if i.isHidden == false {
                successCount += 1
            }
        }
        
        if successCount == 12{
            
            let finalScore = (1200 - (1200 % tabCount))/tabCount
            
            if highScore < finalScore{
                highScore = finalScore
            }
            
            let scoreAlert = UIAlertController(title: "Final Score", message: "You got \(finalScore) points.", preferredStyle: .alert)
            
            scoreAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:)))

            present(scoreAlert, animated: true, completion: nil)
            userMoneyAmount += finalScore
            
            
        } else {
            let scoreAlert = UIAlertController(title: "Final Score", message: "You haven't finished the game.", preferredStyle: .alert)
            
            scoreAlert.addAction(UIAlertAction(title: "To the starting page", style: .default, handler: scoreAlertDismissed(_:)))
            
            scoreAlert.addAction(UIAlertAction(title: "Back to game", style: .default, handler: nil))

            present(scoreAlert, animated: true, completion: nil)
        }

        
    }

    func scoreAlertDismissed(_ action: UIAlertAction) {
        updateApp(on: .start)
    }
    
}

//This is where I got house clip art logo
//https://webstockreview.net/explore/house-clipart-logo/
