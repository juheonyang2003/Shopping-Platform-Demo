//
//  ViewController.swift
//  AP Project
//
//
//
//MARK: Import
import UIKit

struct Product {
    let nameOfProduct: String
    let priceOfProduct: Int
    var productCount = 0
    var totalPriceOfProduct: Int{
        return priceOfProduct * productCount
    }
    var productPhoto: UIImage{
        return UIImage(named: nameOfProduct)!
        /*

         iPhone image Photo by Aleksander Vlad on Unsplash
         https://unsplash.com/@aleksowlade?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
         iPhone 8 Price 320
             

         Snickers image Photo by Joshua Fernandez on Unsplash
         https://unsplash.com/@calvero?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
         Snickers value pack price 10



         Hoodie Image

         Photo by The Ian on Unsplash
         https://unsplash.com/@theian20?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
         price 20



         Shoes
         Photo by noah boisclair on Unsplash
         https://unsplash.com/@noahboisclair?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
         price 120



         Water bottle
         Photo by Evan Wise on Unsplash
         https://unsplash.com/@evanthewise?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText


         Backback

         https://unsplash.com/@jibarofoto?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
         */
    }
}

//MARK: Enums
enum Mode {
        case homepage
        case browsing
        case cart
    }
enum  AppState {
        case shoppingCart
        case checkout
    case browse
    }

//MARK: Variables
var homePageCount = 0

var userMoneyAmount = 0
    
var totalPriceOfCartItem = 0

var deleteThisCartItem: Int = 0
var removeState = false

var itemsInCartCount = 0

var currentCartItems:[Product] = []
 


//MARK: ViewController
class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIAdaptivePresentationControllerDelegate{
               
    
        //MARK: Local Declarations
    //To display product
   
    var cartItemView: [UIView] = []
    
    var removeButtons: [UIButton] = []
    
    var cartLabels: [UILabel] = []
    let imageNames = ["Bag","Bottle","Candy","Hoodie","Shoe","Phone"]
    
    
    var products: [Product] = []
    var pageNumber = 0
   
   
    var appState:AppState = .checkout {
        didSet{
            
        }
    }
    var mode: Mode = .homepage {
        didSet{
            toCardMatchingButton.isHidden = true
            switch mode {
            case .homepage:
                setUpHomepage()
            case .browsing:
                previousButton.isHidden = true
                previousButton.isEnabled = false
               
                setUpBrowse()
            case .cart:
                setUpCart()
            
            }
        }
        
    }
//MARK: Outlets
    
    @IBOutlet weak var moneyCountLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    //https://www.freeiconspng.com/img/41963
    // Arrow image

    @IBOutlet weak var modeSelector2: UISegmentedControl!
    
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var priceAndName: UILabel!
    
    @IBOutlet weak var homePageMoneyMakerButton: UIButton!
    
    @IBOutlet weak var lightningButtonCorner: UIButton!
   
    @IBOutlet weak var redLightningbolt: UIImageView!
    //redLightningbolt image
    //https://www.clipartmax.com/middle/m2i8K9H7d3H7b1Z5_bolt-clip-art-red-lightning-bolt-clipart/
   
    
    
    @IBOutlet weak var yellowlightningbolt: UIImageView!
    // Lightning Clip Art
    // https://webstockreview.net/image/lightning-clipart-high-resolution/2915967.html

    
    @IBOutlet weak var moneyImageView: UIImageView!
    // Money image
    // https://www.gamapatobranco.org.br/arquivo_usu/institucional/docanexo/sgsites-huner-20190901-150539.pdf

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var cartButton: UIButton!
    // Shopping Cart
    // https://creazilla.com/nodes/78045-shopping-cart-clipart

            //MARK: Cart Weak Outlets
    
    //Cart Labels
    
    @IBOutlet weak var priceAndName1: UILabel!
    
    @IBOutlet weak var priceAndName2: UILabel!
    
    @IBOutlet weak var priceAndName3: UILabel!
    
    @IBOutlet weak var priceAndName4: UILabel!
    
    @IBOutlet weak var priceAndName5: UILabel!
   
    // Cart Remove Buttons
    
    @IBOutlet weak var remove1: UIButton!
    
    @IBOutlet weak var remove2: UIButton!
    
    @IBOutlet weak var remove3: UIButton!
    
    @IBOutlet weak var remove4: UIButton!
    
    @IBOutlet weak var remove5: UIButton!
    
    //Cart UI Views
    
    @IBOutlet weak var cartView: UIView!
    
    @IBOutlet weak var removeAndPriceName1: UIView!
    
    @IBOutlet weak var removeAndPriceName2: UIView!
    
    @IBOutlet weak var removeAndPriceName3: UIView!
    
    @IBOutlet weak var removeAndPriceName4: UIView!
    
    @IBOutlet weak var removeAndPriceName5: UIView!
    
    
    @IBOutlet weak var itemsInCartCountLabel: UILabel!
    
    @IBOutlet weak var checkOutButton: UIButton!
    
    
    //Profile image
    //http://www.pngall.com/profile-png/download/51607

   
    
    
    
    
    
    
    
    
    
    
    
    
//MARK: Function Outlets
    

    
                //MARK: Cart
@IBAction func cartButton(_ sender: Any) {
        modeSelector2.selectedSegmentIndex = 2
        mode = .cart
    }
    
@IBAction func addToCartButton(_ sender: Any) {
    if itemsInCartCount == 5 {
        addToCartButton.isEnabled = false
        if currentCartItems.count == cartItemView.count {
            print("too many items in the cart")
            let alert = UIAlertController(title: "Dear Customer", message: "Too many items in the cart", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            addToCartButton.isEnabled = false
        }
    } else {
        itemsInCartCount += 1
        addToCartButton.isEnabled = true
        
    }
    if currentCartItems.count < cartItemView.count {
        currentCartItems.append(products[pageNumber-1])
    }
    
itemsInCartCountLabel.text = "\(itemsInCartCount)"
   
    }
    
@IBAction func removeButton1(_ sender: Any) {
      
        // currentCartItems.remove(at:0)
        print("Item 1 was removed ")
    
    removeState = true
    deleteThisCartItem = 0
    overall(currentMode: mode)
   
    
    }
    
@IBAction func removeButton2  (_ sender:Any){
    removeState = true
    deleteThisCartItem = 1
    overall(currentMode: mode)
   
    }
@IBAction func removeButton3 (_ sender:Any){
    removeState = true
    deleteThisCartItem = 2
    overall(currentMode: mode)
   
    }
    
@IBAction func removeButton4 (_ sender:Any){
    removeState = true
    deleteThisCartItem = 3
    overall(currentMode: mode)
    
    }
@IBAction func removeButton5 (_ sender:Any){
    removeState = true
    deleteThisCartItem = 4
    overall(currentMode: mode)
    
    }
    
   
@IBAction func modeSelector(_ sender: Any) {
        if modeSelector2.selectedSegmentIndex == 0{
            mode = .browsing
        }else if modeSelector2.selectedSegmentIndex == 1{
            mode = .homepage
        }else if modeSelector2.selectedSegmentIndex == 2  {
            mode =  .cart
            
            addToCartButton.isHidden = true
    }
    overall(currentMode: mode)
}
    
  
                    //MARK: General
@IBAction func lightningButtonCorner(_ sender: Any) {
        
        mode = .homepage
        modeSelector2.selectedSegmentIndex = 1
    }
   
   
    
@IBAction func homePageMoneyMakerButton(_ sender: Any) {
    
    print("\(userMoneyAmount)")
    userMoneyAmount += 1
        moneyCountLabel.text = " \(userMoneyAmount)"
    }
    
    
    
@IBAction func previousButton(_ sender: Any) {
        print ("Back button is working ")
        pageNumber -= 1
       
        if pageNumber == 0 {
            pageNumber = products.count
        }
        overall(currentMode: mode)
        
    }
    
@IBAction func nextButton(_ sender: Any) {
        print("Next button is working")
        pageNumber += 1
        if pageNumber == products.count + 1 {
            pageNumber = 1
            
           
        }
       
  
        overall(currentMode: mode)
    }
    
    @IBOutlet weak var toCardMatchingButton: UIButton!
    
    @IBAction func toCardMatching(_ sender: Any) {
    }
    
    @IBAction func checkOutAction(_ sender: Any) {
        print("\(currentCartItems)")
         for i in currentCartItems{
           
             totalPriceOfCartItem += i.priceOfProduct
         }
         if totalPriceOfCartItem > userMoneyAmount {
            print("\(totalPriceOfCartItem)\(currentCartItems)")
             let alert = UIAlertController(title: "Dear Customer", message: "You dont have enough money ", preferredStyle: UIAlertController.Style.alert)
             alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
             totalPriceOfCartItem = 0
         } else{
            
            userMoneyAmount -= totalPriceOfCartItem
           
    moneyCountLabel.text = "\(userMoneyAmount )"
             print("\( userMoneyAmount - totalPriceOfCartItem)")
            
             currentCartItems = []
            itemsInCartCount = currentCartItems.count
            itemsInCartCountLabel.text = "\(itemsInCartCount)"
             let alert = UIAlertController(title: "Dear Customer", message: "Your purchase is complete.", preferredStyle: UIAlertController.Style.alert)
             alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
            totalPriceOfCartItem = 0
            
         }
       
        overall(currentMode: mode)
        print("This is money amount: \(userMoneyAmount)")
     }
    
    

    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyCountLabel.text = "\(userMoneyAmount)"
        cartView.backgroundColor = .systemYellow
        //MARK: Local Declarations:
       
        
        let candy = Product(nameOfProduct: "Candy", priceOfProduct: 5)
        let phone = Product(nameOfProduct: "Phone", priceOfProduct: 1000)
        let bag = Product(nameOfProduct: "Bag", priceOfProduct: 50)
        let bottle = Product(nameOfProduct: "Bottle", priceOfProduct: 20)
        let shoe = Product(nameOfProduct: "Shoe", priceOfProduct: 30)
        let hoodie = Product(nameOfProduct: "Hoodie", priceOfProduct: 10)
        
        //Alert Functions for user when login is completed
        let alert = UIAlertController(title: "Dear Customer", message: "Welcome to Lightning shopper. Click the Lightning Button to make money.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        // Do any additional setup after loading the view, typically from a nib.
        setUpHomepage()
        
        
        //MARK: Adding Items to the array
        //Possible repeating functions
        products.append(candy)
        products.append(phone)
        products.append(bag)
        products.append(bottle)
        products.append(shoe)
        products.append(hoodie)
        
        modeSelector2.selectedSegmentIndex = 1
       
        cartItemView.append(contentsOf: [removeAndPriceName1, removeAndPriceName2, removeAndPriceName3, removeAndPriceName4, removeAndPriceName5])
        
        cartLabels.append(contentsOf: [priceAndName1, priceAndName2, priceAndName3, priceAndName4, priceAndName5])
  }
   

 
    //Main function with branches, triggers main functions depending on what mode we are in.
    //MARK: Overall Function
    func overall(currentMode: Mode) {
        switch currentMode{
        case .browsing:
            updateBrowsingUI()
        case .cart:
            //MARK: CartUI
            previousButton.isHidden = true
            previousButton.isEnabled = false
            nextButton.isHidden =  true
            nextButton.isEnabled = false
            imageView.isHidden = true
            
            cartButton.isHidden = false
            cartButton.isEnabled = true
            lightningButtonCorner.isHidden = false
            lightningButtonCorner.isEnabled = true
            homePageMoneyMakerButton.isEnabled = false
            priceAndName.isHidden = true
       
            redLightningbolt.isHidden = false
            
            yellowlightningbolt.isHidden = true
            if removeState == true {
                
                currentCartItems.remove(at: deleteThisCartItem)
                    itemsInCartCount -= 1
                    itemsInCartCountLabel.text = "\(itemsInCartCount)"
              removeState = false
            }
            for i in cartItemView{
                i.isHidden = true
                lightningButtonCorner.isHidden = false
            }
            
            if currentCartItems.count > 0 {
                
                checkOutButton.isHidden = false
                
                for i in 0...currentCartItems.count - 1{
                        cartItemView[i].isHidden = false
                }
                cartItemView[currentCartItems.count - 1].isHidden = false
                
                //It should show the products on cart page
                for i in 0 ... currentCartItems.count - 1 {
                    cartLabels[i].text = "\(currentCartItems[i].nameOfProduct)   $\(currentCartItems[i].priceOfProduct)"
                }
                itemsInCartCountLabel.text = "\(itemsInCartCount)"
                
            
                
             
                itemsInCartCountLabel.text = "\(itemsInCartCount)"
            }
        case .homepage:
            updateHomepageUI()
        }
       
        
     
      
    }
    
    func disableCornerButton(){
        cartButton.isHidden = true
        cartButton.isEnabled = false
        lightningButtonCorner.isHidden = true
        lightningButtonCorner.isEnabled = false
    }
    
    
    func updateHomepageUI() {
        previousButton.isHidden = true
        previousButton.isEnabled = false
        nextButton.isHidden =  true
        nextButton.isEnabled = false
        
        disableCornerButton()
        priceAndName.isHidden = true
        redLightningbolt.isHidden = false
        
        yellowlightningbolt.isHidden = false
        priceAndName.textColor = .systemRed
      
        itemsInCartCountLabel.text = "\(itemsInCartCount)"
        checkOutButton.isHidden = true
        lightningButtonCorner.isHidden = false
        cartButton.isHidden = false
        cartButton.isEnabled = true
        lightningButtonCorner.isEnabled = true
       }
    
    
    //MARK: BrowsingUI
    func updateBrowsingUI() {
        imageView.image = products[pageNumber-1].productPhoto
       
priceAndName.text = "\(products[pageNumber - 1].nameOfProduct)   $\(products[pageNumber-1].priceOfProduct)"
 
        cartButton.isHidden = false
        cartButton.isEnabled = true
        lightningButtonCorner.isHidden = false
        lightningButtonCorner.isEnabled = true
        priceAndName.isHidden = false
        redLightningbolt.isHidden = true
        
        yellowlightningbolt.isHidden = false
        
        priceAndName.textColor = .white
        if modeSelector2.selectedSegmentIndex == 1 || modeSelector2.selectedSegmentIndex == 2{
            
            priceAndName.textColor = .systemRed
            priceAndName.isHidden = true 
        }
        
        itemsInCartCountLabel.text = "\(itemsInCartCount)"

        checkOutButton.isHidden = true
       }
    
    
    
    
    
    
    // Setup Functions
    
func setUpBrowse(){
    
    
    imageView.isHidden = false
    previousButton.isHidden = false
    previousButton.isEnabled = true
    nextButton.isHidden =  false
    nextButton.isEnabled = true
    homePageMoneyMakerButton.isEnabled = false
    
    addToCartButton.isHidden = false
    addToCartButton.isEnabled = true
  pageNumber = 1
    overall(currentMode: mode)
    priceAndName.isHidden = false
   
    
    checkOutButton.isHidden = true
    
    view.backgroundColor = .systemRed
    redLightningbolt.isHidden = true
    
    yellowlightningbolt.isHidden = false
    cartView.isHidden = true 
   
    
    
    itemsInCartCountLabel.text = "\(itemsInCartCount)"
    
   
    }
    
    func setUpHomepage(){
        imageView.isHidden = true
       
        previousButton.isHidden = true
        nextButton.isHidden =  true
        nextButton.isEnabled = false
        homePageMoneyMakerButton.isHidden = false
        homePageMoneyMakerButton.isEnabled = true
        
        addToCartButton.isHidden = true
        priceAndName.isHidden = true
        
        disableCornerButton()
        overall(currentMode: mode)
        view.backgroundColor = .systemRed
    
        redLightningbolt.isHidden = true
        
        yellowlightningbolt.isHidden = false
      
        addToCartButton.isHidden = true
        cartView.isHidden = true
       
        itemsInCartCountLabel.text = "\(itemsInCartCount)"
        
        toCardMatchingButton.isHidden = false
        checkOutButton.isHidden = true
        yellowlightningbolt.isHidden = false
        
    }
    
    func setUpCart(){
        
        //MARK: One main (do this later)
     //if number of current cart items = 0
       // alert: oh your cart is empty
    //    else if
        
        //for in loop for this:
        previousButton.isHidden = true
        previousButton.isEnabled = false
        nextButton.isHidden =  true
        nextButton.isEnabled = false
        imageView.isHidden = true
        
        homePageMoneyMakerButton.isHidden = true
        priceAndName.isHidden = true
        view.backgroundColor = .systemYellow
        
        redLightningbolt.isHidden = false
        addToCartButton.isHidden = true
        yellowlightningbolt.isHidden = true
        addToCartButton.isHidden = false
        cartView.isHidden = false
        
        cartView.backgroundColor =  .systemYellow
        itemsInCartCountLabel.text = "\(itemsInCartCount)"
        checkOutButton.isHidden = false
        
        
    }
   
    

    
    
  
    
    
    
}

    








    


