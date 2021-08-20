//
//  ViewController5.swift
//  竜輝firstapp
//
//  Created by Tatsuki Tsuchiyama on 2020/09/10.
//  Copyright © 2020 Tatsuki Tsuchiyama. All rights reserved.
//

import UIKit
import WebKit

class ViewController5: UIViewController {
    @IBOutlet weak var webView1: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "https://connect.garmin.com/modern") {
                   let request = NSURLRequest(url: url as URL)
                   webView1.load(request as URLRequest)
               }
        }
    }
    

    
