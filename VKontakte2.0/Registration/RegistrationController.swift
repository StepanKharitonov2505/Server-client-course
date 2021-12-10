//
//  RegistrationControllerViewController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 17.11.2021.
//

import UIKit

class RegistrationController: UIViewController {

    @IBOutlet weak var buttonTuning: UIButton!
    @IBOutlet var blurLayer: UIView!
    @IBOutlet weak var loginRegistration: UITextField!
    @IBOutlet weak var passwordRegistration: UITextField!
    
    var visualEffectView: UIView?
    var dataUser = RegistrationRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGesture)
        blurMotion()
    }
    
    func blurMotion() {
        let blurEffect = UIBlurEffect(style: .dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = self.view.frame
            self.view.addSubview(visualEffectView)
            self.view.sendSubviewToBack(visualEffectView)
            self.visualEffectView = visualEffectView
        visualEffectView.alpha = 0.9
    }
    
    func dismissEnd() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Логика экшена кнопки
    
    @IBAction func endOfRegistration(_ sender: Any) {
        if loginRegistration.text != "" && passwordRegistration.text != "" {
            let newUserData = RegistrationData(login: loginRegistration.text!, password: passwordRegistration.text!)
            RegistrationRepository.dataUsers.append(newUserData)
            dismissEnd()
        }
        return
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}
