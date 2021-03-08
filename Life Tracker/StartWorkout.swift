//
//  StartWorkout.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//

import Foundation
import UIKit

struct Exercise:Codable{
    var Date_:String
    var name_of_ :String
    var weight_:Double
    var rep_: Int
    var set_: Int
}
/*
struct TempExercise{
    var name_of_ :String
    var weight_:Double
    var rep_: Int
    var set_: Int
}
 */
/*
protocol startWorkoutDelegate {
    func didtapfinish(_ finLog: StartWorkoutLog)
}
 */

class StartWorkoutLog : UIViewController, UITableViewDelegate, UITableViewDataSource, TextCellDelegate{
    var current_Log : [Exercise] = []
    var set_count:Int = 1
    func didTapAddButton(_ textCell: TextCell_) {
        // counts the set, if the user enters the same exercise right after, it will add one to set
        if(current_Log.count == 0) {
            set_count = 1
          }
        else if(textCell.userExercise.text == current_Log[current_Log.count - 1].name_of_){
            set_count += 1
              }
          else{
            set_count = 1
          }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy"
        let result = formatter.string(from: date)
        
        guard let inEx = textCell.userExercise.text else { return }
        guard let inWei = Double(textCell.userWeight.text!) else { return }
        guard let inRep = Int(textCell.userRep.text!) else { return }
        print(result)
        current_Log.append(Exercise(Date_: result, name_of_: inEx, weight_: inWei, rep_: inRep, set_: set_count))

        textCell.userSet.text = String(set_count)
        tableView_.reloadData()
    }
    
    @IBAction func cancelWorkoutPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        current_Log.removeAll()
    }
    
    @IBAction func finishWorkoutPressed(_ sender: Any) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(current_Log), forKey:"Array")
        reload.shared.first.tableview_fin.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    //currently this methood only lets you display your workouts from the previous session
    //a future addition could be to set up a database that stores all workouts
    @IBOutlet weak var tableView_: UITableView!
    
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete && indexPath.row < current_Log.count){
            current_Log.remove(at: indexPath.row)
            set_count -= 1
            tableView.reloadData()
        }
        if editingStyle == .insert{}
        
        print("here")
        for i in current_Log{
            print(i)
        }
        tableView.reloadData()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return current_Log.count + 1 //current_Log.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //allow index path to retun a different height
        return 80
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell" ) as! TextCell_
        cell.userExercise.delegate = self as? UITextFieldDelegate
        cell.userWeight.delegate = self as? UITextFieldDelegate
        cell.userRep.delegate = self as? UITextFieldDelegate
        cell.delegate = self 

        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView_.delegate = self
        self.tableView_.dataSource = self
    }
 

}

