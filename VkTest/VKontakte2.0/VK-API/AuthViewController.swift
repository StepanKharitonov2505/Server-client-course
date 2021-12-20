//
//  AuthViewController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 17.12.2021.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView! {
        didSet{
                    webView.navigationDelegate = self
              }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autorizeToVK()
    }

    func autorizeToVK() {
    
    var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                URLQueryItem(name: "client_id", value: "8031614"),
                URLQueryItem(name: "display", value: "mobile"),
                URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                URLQueryItem(name: "scope", value: "262150"),
                URLQueryItem(name: "response_type", value: "token"),
                URLQueryItem(name: "revoke", value: "1"),
                URLQueryItem(name: "v", value: "5.68")
            ]
            
            let request = URLRequest(url: urlComponents.url!)
            
            webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                   decisionHandler(.allow)
                   return
               }
        
        let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                                .reduce([String: String]()) { result, param in
                                    var dict = result
                                    let key = param[0]
                                    let value = param[1]
                                    dict[key] = value
                                    return dict
                            }
        
        guard let token = params["access_token"], let userId = params["user_id"] else {
            return
        }
        
        Session.user.token = token
        Session.user.userId = Int(userId) ?? 0
        
        performSegue(withIdentifier: "showAppSegue", sender: nil)
        
        print(url)
        decisionHandler(.cancel)
    }

}
