//
//  LoginFromController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 01.11.2021.
//

import UIKit

class LoginFromController: UIViewController {

    @IBOutlet var MainViewGradient: UIView!
    @IBOutlet weak var LoginInput: UITextField!
    @IBOutlet weak var PasswordInput: UITextField!
    @IBOutlet weak var ScrollView: UIScrollView!

    var logoView: UIView?
    var visualEffectView: UIView?
    var usersData = RegistrationRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainGradient()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        ScrollView?.addGestureRecognizer(hideKeyboardGesture)
        firstEntrance()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "GoMyApp" {
        let CheckResult = CheckUserData()
        
        if !CheckResult {
            ShowLoginError()
        }
        
        return CheckResult
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
           NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
       }
    
    // MARK: func
    
    func mainGradient() {
    let mainGradnt = CAGradientLayer()
        mainGradnt.colors = [UIColor.purple.cgColor, UIColor.init(red: 4, green: 17, blue: 27, alpha: 1)]
        mainGradnt.locations = [ 0 as NSNumber, 1 as NSNumber]
        mainGradnt.startPoint = CGPoint.init(x: 0, y: 0)
        mainGradnt.endPoint = CGPoint(x: 0.0, y: 1.0)
        MainViewGradient.layer.insertSublayer(mainGradnt, at: 0)
        mainGradnt.frame = MainViewGradient.bounds
    }
    
    // MARK: Function
    
    func CheckUserData() -> Bool {
        guard let login = LoginInput.text,
              let password = PasswordInput.text else {return false}
        var returnBool: Bool = false
        var filter = RegistrationRepository.dataUsers.filter({$0.login == login && $0.password == password})
        if filter.count > 0 {
        let newfilters = filter[0]
        if login == newfilters.login && password == newfilters.password {
            print("Successed")
            returnBool = true
            filter.removeAll()
          }
          
        }
        return returnBool
    }
    
    func blurMotion() {
            let blurEffect = UIBlurEffect(style: .dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = self.view.frame
            self.view.addSubview(visualEffectView)
            self.visualEffectView = visualEffectView
            visualEffectView.alpha = 1
            UIView.transition(
                with: self.view,
                duration: 0.3,
                options: [.transitionCrossDissolve],
                animations: { [weak self] in
            self?.view.addSubview(visualEffectView)},
                completion: nil)
    }
    
    func ShowLoginError() {
        
        let alert = UIAlertController(title: "Упс, что-то пошло не так", message: "Возможно, вы ввели неверные данные", preferredStyle: .alert)
           
           let actionalert = UIAlertAction(
            title: "Попробовать снова",
            style: .cancel,
            handler: {_ in UIView.animate(withDuration: 0.3, animations: {[weak self] in self?.visualEffectView?.alpha = 0})})
           
        alert.addAction(actionalert)
        blurMotion()
           present(alert, animated: true, completion: nil)
           
    }
    
    
    func firstEntrance() {
        blurMotion()
        registerCustomView()
        UIView.animate(
            withDuration: 1.5,
            delay: 4,
            options: [.transitionCrossDissolve],
            animations: { [weak self] in
                self?.visualEffectView?.alpha = 0
            },
            completion: nil)
        UIView.animate(
            withDuration: 1,
            delay: 4,
            options: [.transitionCrossDissolve],
            animations: {[weak self] in
                self?.logoView?.alpha = 0
                self?.logoView?.transform = CGAffineTransform(scaleX: 12, y: 12)
            },
            completion: nil)
    }
    
    // MARK: Privat Function, register
    private func registerCustomView() {
        guard let viewVk = UINib(nibName: "loadView", bundle: .main).instantiate(withOwner: nil, options: nil).first as? UIView else {return}
        self.logoView = viewVk
        viewVk.center.x = self.view.center.x
        viewVk.center.y = self.view.center.y
        self.view.addSubview(viewVk)
    }
    
    // MARK: @Objc
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification:Notification) {
        let contentInsets = UIEdgeInsets.zero
        ScrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func LoginButtonPressed(_ sender: Any){
       }
    
    // MARK: unwindSegue
    @IBAction func myUnwindActionFirst(unwindSegue: UIStoryboardSegue){
        LoginInput.text = nil
        PasswordInput.text = nil
    }
    
    @IBAction func myUnwindActionSecond(unwindSegue: UIStoryboardSegue){
        LoginInput.text = nil
        PasswordInput.text = nil
    }
    
}
