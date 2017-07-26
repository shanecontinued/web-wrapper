//
//  ViewController.swift
//  Web Wrapper
//
//  Created by Techgnarlogy on 7/11/17.
//  Copyright © 2017 Techgnarlogy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        [webView.topAnchor.constraint(equalTo: view.topAnchor),
         webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         webView.leftAnchor.constraint(equalTo: view.leftAnchor),
         webView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach  { anchor in
            anchor.isActive = true
        }
        
        if let url = URL(string: "https://google.com") {
            webView.load(URLRequest(url: url))
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished navigating to url \(String(describing: webView.url))")
    }
    
}
