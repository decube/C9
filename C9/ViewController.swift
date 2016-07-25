//
//  ViewController.swift
//  C9
//
//  Created by guanho on 2016. 7. 24..
//  Copyright © 2016년 guanho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //웹뷰 딜리게이트 추가
        self.webView.delegate = self
        //웹뷰 띄우기
        self.webView.loadRequest(NSURLRequest(URL : NSURL(string: "https://ide.c9.io/guanho/oyanggo")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

