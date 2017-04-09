//
//  FullArticleVC.swift
//  NewsFeed
//
//  Created by Faisal Akhtar on 2017-04-09.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class FullArticleVC: UIViewController {

    var dest_url: String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-------------------------------------------------------",dest_url)
        let articleurl = URL(string: dest_url)
        let article_request = URLRequest(url: articleurl!)
        webView.loadRequest(article_request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
