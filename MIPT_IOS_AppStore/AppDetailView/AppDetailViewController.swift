//
//  AppViewController.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 18/10/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class AppDetailViewController: UIViewController {
    
    private var app: App?
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    
    func setApp(app: App) {
        self.app = app
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel.text = app?.name
        
        appImageView.image = UIImage(named: app?.logoName ?? "Image")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
}

