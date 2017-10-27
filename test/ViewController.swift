//
//  ViewController.swift
//  test
//
//  Created by maxadorable on 10/26/17.
//  Copyright © 2017 maxadorable. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    //MARK: Properties
    @IBOutlet weak var title_text: UILabel!
    
    @IBOutlet weak var input: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        input.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        title_text.text = textField.text
    }
    //MARK: Actions
    @IBAction func actionkey(_ sender: UIButton)
    {
        title_text.text = "auriga "
    }
    
}

