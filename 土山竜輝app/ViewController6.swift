//
//  ViewController6.swift
//  竜輝firstapp
//
//  Created by Tatsuki Tsuchiyama on 2020/09/14.
//  Copyright © 2020 Tatsuki Tsuchiyama. All rights reserved.
//

import UIKit
import WebKit

class ViewController6: UIViewController {
    
    @IBOutlet weak var webView2: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = NSURL(string: "https://weather.yahoo.co.jp/weather/43/8610/43206.html") {
        let request = NSURLRequest(url: url as URL)
        webView2.load(request as URLRequest)
    }
 }
}
