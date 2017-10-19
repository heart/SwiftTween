//
//  DemoCellTableViewCell.swift
//  SwiftTween_Example
//
//  Created by narongrit kanhanoi on 19/10/2560 BE.
//  Copyright © 2560 CocoaPods. All rights reserved.
//

import UIKit
import SwiftTween


class DemoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var dot: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var canvas: UIView!
    
    var ease:Ease?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickReplay(_ sender: Any) {
        
    }
    
    public func setEasing(ease:Ease?){
        self.ease = ease
    }
    
}
