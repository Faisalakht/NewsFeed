//
//  PostCell.swift
//  NewsFeed
//
//  Created by Faisal Akhtar on 2017-04-09.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class PostCell : UITableViewCell {

    
    @IBOutlet weak var Img: UIImageView!

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var gview: UIView!

    @IBOutlet weak var title: UILabel!
    
    var post : Posts! {
        
        
        didSet{
            self.updateUI()
            
            
        }
    }
    
    private func updateUI()
    {

        
        
        //Gradient for the bottom of the cell
        
        let mask = CAGradientLayer()
        mask.startPoint = CGPoint(x: 1.0, y: 0.0)
        mask.endPoint = CGPoint(x:1.0, y:1.0)
        let whiteColor = UIColor.white
        mask.colors = [whiteColor.withAlphaComponent(0.0).cgColor,whiteColor.withAlphaComponent(1.0),whiteColor.withAlphaComponent(1.0).cgColor]
        mask.locations = [NSNumber(value: 0.0),NSNumber(value: 0.05),NSNumber(value: 1.0)]
        mask.frame = gradientView.bounds
        gradientView.layer.mask = mask

        
        
        
        
        
        let imgurl = URL(string: post.PostImage)
        self.Img.sd_setImage(with: imgurl)
        self.title.text = post.Title
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.gradientView.backgroundColor = UIColor.white;
    }
    
}
