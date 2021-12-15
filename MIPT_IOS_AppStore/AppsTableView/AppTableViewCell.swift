//
//  AppTableViewCell.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 19/10/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
    
    
//    }
    
    @IBAction func downloadPresser(_ sender: Any) {
        spinner.startAnimating()
        spinner.isHidden = false
        downloadButton.isHidden = true
    }
    
}
