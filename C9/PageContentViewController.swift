//
//  PageContentViewController.swift
//  C9
//
//  Created by guanho on 2016. 7. 31..
//  Copyright © 2016년 guanho. All rights reserved.
//


import UIKit

class PageContentViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet var spin: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    var pageIndex: Int = 0
    var strTitle: String!
    var webViewUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spin.hidden = false
        spin.startAnimating()
        self.webView.delegate = self
        self.webView.loadRequest(NSURLRequest(URL : NSURL(string: webViewUrl)!))
        lblTitle.text = strTitle
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        spin.hidden = true
        spin.stopAnimating()
    }
}
