//
//  ViewController.swift
//  AlertsAndDialogs
//
//  Created by Boris on 28/08/2017.
//  Copyright © 2017 dolyaboris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alert:UIAlertController!
    var okAction : UIAlertAction!
    
    @IBOutlet var dialogView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCustomDialog))
    }
    
    func showCustomDialog(){
        self.dialogView.center.x = self.view.center.x
        self.dialogView.center.y = self.view.center.y
        
        dialogView.transform = CGAffineTransform(translationX: 0, y: -500)
        
        self.view.addSubview(self.dialogView)
        
        UIView.animate(withDuration: 0.5){
            self.dialogView.backgroundColor = UIColor.gray
            self.dialogView.transform = CGAffineTransform.identity
        }
        
        
    }
    
    func showActionSheet(){
        let alert = UIAlertController(title: "Choose color", message: "Pick it", preferredStyle: .actionSheet)
        
        //actionSheet only have actions!!!
        alert.addAction(UIAlertAction(title: "Red", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.red
        }))
        
        alert.addAction(UIAlertAction(title: "Green", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.green
        }))
        
        alert.addAction(UIAlertAction(title: "Blue", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.leftBarButtonItem
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Throw a stone on Kahleessi?", message: "🏝🇧🇧", preferredStyle: .alert)
        
        //Action is like a button
        let okAction = UIAlertAction(title: "Sure", style: .default) { (action) in
            print("Throwing!!!\nBla bla blabla dragon")
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    func textChanged(){
        let okAction = alert.actions[1]
        
        let name = alert.textFields?[0].text ?? ""
        let pass = alert.textFields?[1].text ?? ""
        
        okAction.isEnabled = name.characters.count >= 6 && pass.characters.count >= 6
    }
    func showAlertWithTextFields(){
        self.alert = UIAlertController(title: "login", message: "please login to continue", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "User Name..."
            
            textField.rightView = UIImageView(image: #imageLiteral(resourceName: "message"))
            textField.rightViewMode = .always
            
            textField.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Password..."
            textField.isSecureTextEntry = true
            
            textField.rightView = UIImageView(image: #imageLiteral(resourceName: "password"))
            textField.rightViewMode = .always
            
            textField.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
        }
        okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("login you in...")
            
            let userName = self.alert.textFields?[0].text ?? ""
            let pass = self.alert.textFields?[1].text ?? ""
            
            print("\(userName) \(pass)")
        }
        okAction.isEnabled = false
        
        let cancellAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancelled")
        }
        
        alert.addAction(cancellAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}








