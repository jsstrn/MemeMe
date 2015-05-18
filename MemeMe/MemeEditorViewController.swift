//
//  MemeEditorViewController.swift
//  MemeMe
//
//  Created by Jesstern Rays on 18/5/15.
//  Copyright (c) 2015 Jesstern Rays. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate,  UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    // MARK: Initial Methods
    
    override func viewWillAppear(animated: Bool) {
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .ScaleAspectFit
        
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : -3.0
        ]
        
        topTextField.delegate = self
        topTextField.textAlignment = .Center
        topTextField.text = "TOP"
        topTextField.defaultTextAttributes = memeTextAttributes
        
        bottomTextField.delegate = self
        bottomTextField.textAlignment = .Center
        bottomTextField.text = "TOP"
        bottomTextField.defaultTextAttributes = memeTextAttributes
    }
    
    // MARK: Image Picker
    
    @IBAction func pickImageFromPhotoLibrary(sender: UIBarButtonItem) {
        imagePicker(.PhotoLibrary)
    }
    
    @IBAction func pickImageFromCamera(sender: UIBarButtonItem) {
        imagePicker(.Camera)
    }
    func imagePicker(sourceType: UIImagePickerControllerSourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Memory Warning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

