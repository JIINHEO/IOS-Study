//
//  LoginViewController.swift
//  ios-login
//
//  Created by 허지인 on 2021/11/14.
//

import Foundation
import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginButton,googleLoginButton,appleLoginButton].forEach{
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //NavigationBar 숨기기 (첫화면이라 없앰)
        navigationController?.navigationBar.isHidden = true
        
        // Google Sign In
        //GIDSignIn.sharedInstance.presentingViewController = self
    }
    
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
          if let error = error {
              print("ERROR", error.localizedDescription)
            return
          }

          guard let authentication = user?.authentication,
                let idToken = authentication.idToken else { return }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)

            Auth.auth().signIn(with: credential) { _, _ in
                self.showMainViewController()
            }
        }
    }
    
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        UIApplication.shared.windows.first?.rootViewController?.show(mainViewController, sender: nil)
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        //Firebase 인증
    }
    
    
    
}
