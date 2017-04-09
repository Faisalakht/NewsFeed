//
//  NewsTVC.swift
//  NewsFeed
//
//  Created by Faisal Akhtar on 2017-04-08.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class NewsTVC: UITableViewController{

    var arr = [Posts]()
    var dest_url : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 250.0;
        get_data()
        self.tableView.dataSource = self;
        //get_data()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        
       // let imgview = cell.viewWithTag(1) as! UIImageView
        //let lbl = cell.viewWithTag(2) as! UILabel
        //lbl.text = arr[indexPath.row].Title
        //let imgurl = URL(string: arr[indexPath.row].PostImage)
        //imgview.sd_setImage(with: imgurl)
        
        cell.post = arr[indexPath.row]
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
        dest_url = arr[indexPath.row].sendURL

        performSegue(withIdentifier: "webSeg", sender: self);
    }
    
    
    
    
    
    
    
    
    func get_data ()
    {
        let apiurl = NSURL(string: "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=112947519e4a41e48da28e8c35965f7b");
        let task = URLSession.shared.dataTask(with: apiurl! as URL) {
            
            
            (data,response,error) in
            
            if error != nil {
                print (error)
                return
                
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                let d = json["articles"] as! [[String: AnyObject]]
                print(d)
                for items in d
                {
                    let title = items["title"]!
                    let imgUrl = items["urlToImage"]! as! String
                    //let imgParsedUrl = URL(string: imgUrl)!
                    let dataurl = items["url"]!;
                    //let img = self.imageParsed(imgData: imgParsedUrl);
                    
                    
                    let NewPost = Posts(Title: title as! String, sendURL: dataurl as! String, PostImage: imgUrl)
                    self.arr.append(NewPost)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
                
            }
            catch let jError {
                
                print (jError)
                
            }
            
            
            
            //let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print(str)
            
            
            
            
            
            
        }
        
        task.resume()
        

        
    }
    
    
    
    

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "webSeg") {
            

            var viewController = segue.destination as! FullArticleVC;
            viewController.dest_url = dest_url
        }
    }
    
    
    
    
    
    
    
}


