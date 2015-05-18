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
    
    // MARK: Initial Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Image Picker
    
    @IBAction func pickImageFromPhotoLibrary(sender: UIBarButtonItem) {
        imagePicker(.PhotoLibrary)
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

