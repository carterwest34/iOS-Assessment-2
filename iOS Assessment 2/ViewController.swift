//
//  ViewController.swift
//  iOS Assessment 2
//
//  Created by Carter West on 10/25/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        submitButton.layer.cornerRadius = 10
    }
    
   //MARK: IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
   @IBOutlet weak var submitButton: UIButton!
    
    //MARK: IBActions
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard
            let firstName = firstNameTextField.text, !firstName.isEmpty,
            let lastName = lastNameTextField.text, !lastName.isEmpty,
            let email = emailTextField.text, !email.isEmpty
        
        else {
            let errorAlert = UIAlertController(title: "Nice Try Chief", message: "Please enter text into each field.", preferredStyle: .alert)
            let errorAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
            errorAlert.addAction(errorAction)
            present(errorAlert, animated: true, completion: nil)
            return
        }
        let newPerson = Person(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!)
        
        let submitAlert = UIAlertController(title: "Greetings", message: "Hello, \(newPerson.firstName) \(newPerson.lastName)! Your email is \(newPerson.email).", preferredStyle: .alert)
        let thanksAction = UIAlertAction(title: "Thanks!", style: UIAlertAction.Style.default)
        submitAlert.addAction(thanksAction)
        self.present(submitAlert, animated: true, completion: nil)
        }
    
}

