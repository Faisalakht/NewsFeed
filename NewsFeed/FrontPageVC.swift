
//
//  FrontPageVC.swift
//  NewsFeed
//
//  Created by Faisal Akhtar on 2017-04-09.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class FrontPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
    
    self.performSegue(withIdentifier: "newsSeg", sender: self);
    
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

  
}
