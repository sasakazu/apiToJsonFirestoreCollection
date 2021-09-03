//
//  loginViewController.swift
//  apiToJsonFirestoreCollection
//
//  Created by 笹倉一也 on 2021/09/03.
//

import UIKit
import Firebase

class loginViewController: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let user = Auth.auth().currentUser?.email
        
        print("current-user\(String(describing: user))")
        
        // Do any additional setup after loading the view.
    }
    


    @IBAction func login(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passTF.text!) { authResult, error in
          // ...
        }
    }
    
    
}
