//
//  AppViewController.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 18/10/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

