//
//  textCell.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//
import Foundation
import UIKit

protocol TextCellDelegate {
func didTapAddButton(_ textCell: TextCell_)
}

class TextCell_: UITableViewCell {

    @IBOutlet weak var userExercise: UITextField!
    @IBOutlet weak var userWeight: UITextField!
    @IBOutlet weak var userSet: UILabel!
    @IBOutlet weak var userRep: UITextField!
    @IBOutlet weak var addbutton: UIButton!
    var delegate: TextCellDelegate? // should be weak

    
    @IBAction func addSet(_ sender: Any) {
        delegate?.didTapAddButton(self)
    }
    
    @IBAction func exerciseCell(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        userExercise.resignFirstResponder()
        userWeight.resignFirstResponder()
        userRep.resignFirstResponder()
    }
}
