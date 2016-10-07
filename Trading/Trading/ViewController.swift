//
//  ViewController.swift
//  Trading
//
//  Created by YeungYee Mei on 5/10/2016.
//  Copyright © 2016年 YeungYee Mei. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CreateAccount(_ sender: AnyObject) {
        
        FIRAuth.auth()?.createUser(withEmail: Email.text!, password: Password.text!, completion: {
            user, error in
            
            if error != nil{
                
                self.login()
                
            }
            else{
                
                print("User Created")
                self.login()
            }
        })
        
    }
    
    func login(){
        
        FIRAuth.auth()?.signIn(withEmail: Email.text!, password: Password.text!, completion: {
            user, error in
            
            if error != nil{
            
                print("sorry")
            
            }else{
            
            print("Huzzah!")}
        })
        
    }
}

