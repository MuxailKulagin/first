//
//  ViewSignUpController.swift
//  Calculator
//
//  Created by Кирилл Кузнецов on 15.06.2020.
//  Copyright © 2020 kuznetsov. All rights reserved.
//

import UIKit

class ViewSignUpController: UIViewController {

    @IBOutlet weak var newUserAccount: UITextField!
    @IBOutlet weak var newUserPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func regNewUser(_ sender: Any) {
        if newUserAccount.text != "" && newUserPassword.text != "" {
            userAccount = newUserAccount.text
            userPassword = newUserPassword.text
            performSegue(withIdentifier: "regSegueTrue", sender: self)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите данные", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
