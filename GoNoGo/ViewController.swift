//
//  ViewController.swift
//  GoNoGo
//
//  Created by Ismael on 7/24/16.
//  Copyright © 2016 Ismael. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var FbLogIn: FBSDKLoginButton!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FbLogIn.delegate = self
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            print("User is already loggen in....")
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            self.FbLogIn.readPermissions = ["public_profile", "email"]
         //   FbLogIn = FBSDKLoginButton()
          //  self.view.addSubview(FbLogIn)
           // FbLogIn.center = self.view.center
           // FbLogIn.readPermissions = ["public_profile", "email"]
           // self.FbLogIn.delegate = self
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


 

    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
     
       
    }
   
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Got an image")
        if let pickedImage:UIImage = (info[UIImagePickerControllerOriginalImage]) as? UIImage {
            let selectorToCall = Selector("imageWasSavedSuccessfully:didFinishSavingWithError:context:")
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, selectorToCall, nil)
        }
        imagePicker.dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user saves an image
        })
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("User canceled image")
        dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user selects cancel
        })
    }

}

