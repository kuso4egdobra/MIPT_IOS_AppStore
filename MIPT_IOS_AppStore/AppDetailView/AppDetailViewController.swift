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
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func setApp(app: App) {
        self.app = app
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel.text = app?.name
        appNameLabel.font = .systemFont(ofSize: 32, weight: .medium)
        
        companyName.text = app?.companyName
        companyName.font = .systemFont(ofSize: 16, weight: .light)
        companyName.textColor = .gray
        
        appImageView.image = UIImage(named: app?.logoName ?? "Image")
        appImageView.layer.cornerRadius = 16.0
    
        downloadButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        downloadButton.layer.cornerRadius = 16.0
        
        shareButton.setImage(UIImage(named: "baseline_ios_share_black_20pt"), for: .normal)
        shareButton.tintColor = UIColor(red: 5/255.0, green: 124/255.0, blue: 255/255.0, alpha: 1)
        
        descriptionView.text = app?.description
        descriptionView.isEditable = false
        
        spinner.isHidden = true
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [app?.name], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func downloadPressed(_ sender: Any) {
        spinner.startAnimating()
        spinner.isHidden = false
        downloadButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
}

