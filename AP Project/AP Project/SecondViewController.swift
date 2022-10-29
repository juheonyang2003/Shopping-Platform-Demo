//
//  SecondViewController.swift
//  AP Project
//
//



import UIKit
import Foundation
import AVKit
import AVFoundation

enum Modes2 {
    case login
    case signUp
}
class SecondViewController: UIViewController,UIAdaptivePresentationControllerDelegate {

    
    var mode2: Modes2 = .login {
        didSet{
            switch mode2 {
            case .login:
                setUpLogin()
            case .signUp:
               setUpSignIn()
            
            }
        }
    }

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func loginButton(_ sender: Any) {
       
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        fullNameLabel.isHidden = false
        fullNameTextFeild.isHidden = false
        UserNameLabel.isHidden = false
        uSerNameTextFeild.isHidden = false
        modeSelector()
       
        emailTextFeild.text = ""
        passwordTextFeild.text = ""
        
        mode2 = .signUp
        if mode2 == .signUp{
            if emailTextFeild.text == "" && passwordTextFeild.text == "" && uSerNameTextFeild.text == "" && fullNameTextFeild.text == ""{
            loginButton.isEnabled = false
            loginButton.setTitle("Enter Credentials ", for: .disabled)
        }else if emailTextFeild.text != "" && passwordTextFeild.text != "" && uSerNameTextFeild.text != "" && fullNameTextFeild.text != ""{
            loginButton.isEnabled = true
            loginButton.setTitle("Login", for: .normal)
        }
        }
        
        
    }
    
    @IBAction func loginViewButton(_ sender: Any) {
    }
    
    @IBOutlet weak var UserNameLabel: UILabel!
  
    @IBAction func userNameTextFeild(_ sender: Any) {
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func emailTextFeild(_ sender: Any) {
        if mode2 == .login{
            
            if emailTextFeild.text == "" && passwordTextFeild.text == ""{
                loginButton.isEnabled = false
                loginButton.setTitle("Enter Credentials ", for: .disabled)
            }else{
                loginButton.isEnabled = true
            }
            if emailTextFeild.text != "" && passwordTextFeild.text != ""{
                loginButton.isEnabled = true
                loginButton.setTitle("Login", for: .normal)
            }
        }
    }
    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBAction func fullNameTextFeild(_ sender: Any) {

    }
    
    
    @IBOutlet weak var fullNameTextFeild: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBAction func passWordTextFeild(_ sender: Any) {
        
        if emailTextFeild.text == "" && passwordTextFeild.text == ""{
            loginButton.isEnabled = false
            loginButton.setTitle("Enter Credentials ", for: .disabled)
        }else{
            loginButton.isEnabled = true
        }
        if emailTextFeild.text != "" && passwordTextFeild.text != ""{
            loginButton.isEnabled = true
            loginButton.setTitle("Login", for: .normal)
        }
        
    }
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    @IBOutlet weak var uSerNameTextFeild: UITextField!
    
    @IBAction func haveAnAccountButton(_ sender: Any) {
        mode2 = .login
        print("The mode is login")
        
    }
    
    @IBOutlet weak var haveAccount: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.isHidden = true
        fullNameTextFeild.isHidden = true
        UserNameLabel.isHidden = true
        uSerNameTextFeild.isHidden = true
        
        loginButton.isEnabled = false
        
   modeSelector()
        updateUI()
    }
    func updateLogin(currentMode:Modes2){
            emailTextFeild.isHidden = false
            emailLabel.isHidden = false
            passwordTextFeild.isHidden = false
            passwordLabel.isHidden = false
            uSerNameTextFeild.isHidden = true
            UserNameLabel.isHidden = true
            fullNameLabel.isHidden = true
            fullNameTextFeild.isHidden = true
            haveAccount.isHidden = true
            
        
      
        
        
        if emailTextFeild.text == "" && passwordTextFeild.text == ""{
            loginButton.isEnabled = false
            loginButton.setTitle("Enter Credentials ", for: .disabled)
        }else if emailTextFeild.text != "" && passwordTextFeild.text != "" {
            loginButton.isEnabled = true
            loginButton.setTitle("Login", for: .normal)
        }
        
            
        

    }
        
        
    func updateSignIn(currentMode: Modes2){
            
       
            
        while currentMode == .signUp {
            
            emailTextFeild.isHidden = false
            emailLabel.isHidden = false
            passwordTextFeild.isHidden = false
            passwordLabel.isHidden = false
            uSerNameTextFeild.isHidden = false
            UserNameLabel.isHidden = false
            fullNameLabel.isHidden = false
            fullNameTextFeild.isHidden = false
            haveAccount.isHidden = false
            
            if emailTextFeild.text == "" && passwordTextFeild.text == "" && uSerNameTextFeild.text == "" && fullNameTextFeild.text == ""{
            loginButton.isEnabled = false
            loginButton.setTitle("Enter Credentials ", for: .disabled)
        }else if emailTextFeild.text != "" && passwordTextFeild.text != "" && uSerNameTextFeild.text != "" && fullNameTextFeild.text != ""{
            loginButton.isEnabled = true
            loginButton.setTitle("Login", for: .normal)
        }
            
            
        }
        
            
        }
        func updateUI(){
            switch mode2 {
            case .login:
                updateLogin(currentMode: .login)
            case .signUp:
                updateSignIn(currentMode: .signUp)
            }
            
            if mode2 == .signUp{
                haveAccount.isHidden = false
            }
        }
       
        
    func modeSelector (){
        if fullNameLabel.isHidden == false   {
            mode2 = .signUp
            print (
            "the mod  is sign up ")
        }else {
            mode2 = .login
            print("The mode is login")
        }
    }
    
    func setUpLogin (){
        emailTextFeild.isHidden = false
        emailLabel.isHidden = false
        passwordTextFeild.isHidden = false
        passwordLabel.isHidden = false
        uSerNameTextFeild.isHidden = true
        UserNameLabel.isHidden = true
        fullNameLabel.isHidden = true
        fullNameTextFeild.isHidden = true
        haveAccount.isHidden = true
        loginButton.setTitle("Enter Credentials", for: .disabled)
    }
    
    func setUpSignIn (){
        emailTextFeild.isHidden = false
        emailLabel.isHidden = false
        passwordTextFeild.isHidden = false
        passwordLabel.isHidden = false
        uSerNameTextFeild.isHidden = false
        UserNameLabel.isHidden = false
        fullNameLabel.isHidden = false
        fullNameTextFeild.isHidden = false
        haveAccount.isHidden = false
        
        loginButton.setTitle("Enter Credentials", for: .disabled)
    }
    

}
