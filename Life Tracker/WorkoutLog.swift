//
//  WorkoutLog.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//

import Foundation
import UIKit

class WorkoutLog : UITableViewController{ //, startWorkoutDelegate {
var finalLog:[Exercise] = []
    var firstTime:Bool = true
    
    @IBOutlet var tableview_fin: UITableView!
    //@IBOutlet weak var finCell: UITableViewCell!
    //@IBOutlet var tableview_fin: UITableView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        reload.shared.first = self
//        tableview_fin.reloadData()
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reload.shared.first = self
        //tableview_fin.reloadData()
        
    }


    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var userDefaultCount:Int = 1
        if let data = UserDefaults.standard.value(forKey:"Array") as? Data {
                  let Log = try? PropertyListDecoder().decode(Array<Exercise>.self, from: data)
            userDefaultCount = Log?.count ?? 1
              }
        return userDefaultCount 
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "finish" ) as! finCell
        if let data = UserDefaults.standard.value(forKey:"Array") as? Data {
            let Log = try? PropertyListDecoder().decode(Array<Exercise>.self, from: data)
            cell.dateLabel.text = Log?[indexPath.row].Date_
            cell.exerciseLabel.text = Log?[indexPath.row].name_of_
            cell.weightLabel.text = "\(Log?[indexPath.row].weight_ ?? 0)"
            cell.repLabel.text = "\(Log?[indexPath.row].rep_ ?? 0)"
            cell.setLabel.text = "\(Log?[indexPath.row].set_ ?? 0)"
        }
        return cell
        }
 }
