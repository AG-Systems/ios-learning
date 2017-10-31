//
//  ViewController.swift
//  test
//
//  Created by maxadorable on 10/26/17.
//  Copyright © 2017 maxadorable. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
    {
    //MARK: Properties
    @IBOutlet weak var title_text: UILabel!
    
    @IBOutlet weak var image_view: UIImageView!
    @IBOutlet weak var input: UITextField!
    
    var typed_input = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        input.delegate = self
        
        input.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Hide the keyboard.
        // textField.resignFirstResponder()
        
        input.resignFirstResponder()
        
        title_text.text = textField.text
        typed_input = textField.text!
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        title_text.text = textField.text
    }
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
    
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
    
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        image_view.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func actionkey(_ sender: UIButton)
    {
        // title_text.text = typed_input
        title_text.text = "Please input another item"
        input.text = ""
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer)
    {
        // Hide the keyboard.
        // input.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    @objc func textFieldDidChange(textField: UITextField)
    {
        
        
        if(textField.text != " " && textField.text != "")
        {
            title_text.text = textField.text!
            typed_input = textField.text!
        }
        else
        {
            title_text.text = "Hello!"
            typed_input = "Hello!"
        }
    }
    
}

