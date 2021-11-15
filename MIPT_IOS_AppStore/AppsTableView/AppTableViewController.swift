//
//  AppTableViewController.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 19/10/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController {

//    let dataSource = [
//        App(name: "youtube", type: "video", logoName: "youtube"),
//        App(name: "whatsapp", type: "social", logoName: "whatsapp"),
//        App(name: "playmarket", type: "shop", logoName: "playmarket"),
//    ]
    private var apps: [App]!
    
    func setApps(apps: [App]) {
        self.apps = apps
    }
    
    @IBOutlet var appTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return apps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AppTableViewCell

        cell.cellLabel.text = apps[indexPath.row].name
        cell.typeLabel.text = apps[indexPath.row].type
        cell.imageCell.image = UIImage(named: apps[indexPath.row].logoName)
//        cell.backgroundColor = .red
//        cell.imageCell.contentMode = .scaleToFill
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
//        let appDetailViewController = AppDetailViewController()
//        self.navigationController?.pushViewController(appDetailViewController, animated: false)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let appDetailViewController = storyBoard.instantiateViewController(withIdentifier: "appDetailViewController") as! AppDetailViewController
        let numApp = indexPath[1]
        appDetailViewController.setApp(app: apps[numApp])
        show(appDetailViewController, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
