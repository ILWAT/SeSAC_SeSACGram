//
//  MapViewControl.swift
//  SeSACGram
//
//  Created by 문정호 on 2023/08/29.
//

import UIKit
import WebKit


class MapViewControl: BaseViewController, WKUIDelegate{
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view=webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func reloadButtonClicked(){
        webView.reload()
    }
    
    func goBackButtonClicked(){
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    func goForwardButtonClicked(){
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
}