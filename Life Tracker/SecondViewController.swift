//
//  SecondViewController.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//
import Foundation
import UIKit



//func quote()

  // }
func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


class SecondViewController : UIViewController {

    var Message_:String = ""
    var Author_:String = ""
    @IBOutlet weak var gifView: UIImageView!
    
    @IBOutlet weak var displayquote: UITextView!

    @IBOutlet weak var authorLabel: UILabel!

    func getAPI(){
      
             let headers = [
                 "x-rapidapi-host": "qvoca-bestquotes-v1.p.rapidapi.com",
                 "x-rapidapi-key": "3eb98a3b6fmsha9aaaf634498c16p11ebbejsnafa0d0504bb8"
             ]

             let request = NSMutableURLRequest(url: NSURL(string: "https://qvoca-bestquotes-v1.p.rapidapi.com/quote?genre=fitness")! as URL,
                                                     cachePolicy: .useProtocolCachePolicy,
                                                 timeoutInterval: 10.0)
             request.httpMethod = "GET"
             request.allHTTPHeaderFields = headers

             let session = URLSession.shared
             let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                 if (error != nil) {
                     print(error!)
                 } else {
                     
                     let str = String(decoding: data!, as: UTF8.self)
             
                     let dicti = convertToDictionary(text: str)
                  if let dictionary = dicti as NSDictionary?{
                      if let dict_message = dictionary["message"] as? String{
                          self.Message_ = dict_message
                     }
                      if let dict_author = dictionary["author"] as? String{
                          self.Author_ = dict_author
                      }
                  }
                    DispatchQueue.main.async { // Correct
                        self.displayquote.text = self.Message_
                        self.authorLabel.text = self.Author_
                    }
                 // print(self.Message_)
                  //print(self.Author_)
                  //print(dicti!["message"]!)
                  //print(dicti!["author"]!)
                 }
             })
             dataTask.resume()
  }
    
    override func viewDidLoad() {
        //let hello = "hello theis is "
        //print("Hello")
        gifView.loadGif(name: "gif" )
        getAPI()
        print("hello")
        print(Message_)
        print(Author_)
        //displayquote.backgroundColor = UIColor.black
        //displayquote.textColor = UIColor.white
        super.viewDidLoad()
        
    }
    

    
    

    }


// an idea to make this work is to not make this the first contoller but make the log the first controller, load the quote and pass it onto this.

// another option is to make a blank viewcontroller with a loading screen so we can take the api request 



/*
 in tab bar contoller check how many itesm in view contollr arrat
 how many items in view did load, if there are 3 then inspect them, add break point so show it
 make sure api response is called after 3 view controllers
 
 if this works
 */

/*
 eaiser way to move to second view contoller
 do code inside app delegate
 
 
 */
/*
 move api all to app deligate and make app deligate do the update
 */

