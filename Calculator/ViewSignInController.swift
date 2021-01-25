//
//  ViewSignInController.swift
//  Calculator
//
//  Created by Кирилл Кузнецов on 15.06.2020.
//  Copyright © 2020 kuznetsov. All rights reserved.
//

import UIKit

class ViewSignInController: UIViewController {

    @IBOutlet weak var inputLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        if inputLogin.text == userAccount && inputPassword.text == userPassword {
            performSegue(withIdentifier: "authSegueTrue", sender: self)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите данные аккаунта", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
    }
    
}
    @IBAction func buttonClearText(_ sender: UIButton) {
        inputLogin.text?.removeAll()
        inputPassword.text?.removeAll()
    }
    
}
