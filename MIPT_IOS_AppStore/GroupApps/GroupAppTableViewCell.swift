//
//  GroupAppTableViewCell.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 15/11/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class GroupAppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title1: UILabel!
    
    @IBOutlet weak var title2: UILabel!
    
    @IBOutlet weak var subTable: SubGroupTableView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        bounds = bounds.inset(by: padding)
    }
}
