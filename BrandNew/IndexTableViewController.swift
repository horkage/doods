//
//  IndexTableViewController.swift
//  BrandNew
//
//  Created by Michael Wood on 2/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class IndexTableViewController: UITableViewController {
    
    var cells = [Cell]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deviceID = appDelegate.someVar!
        
        let jsonURL = URL(string: "http://192.168.0.112:8081/startAllTheThings?deviceID=\(deviceID)")!
        let jsonRawData = try? Data(contentsOf: jsonURL)
        let jsonParsedData = try? JSONSerialization.jsonObject(with: jsonRawData!, options: []) as? [String:Any]
        
        var result = jsonParsedData!
        let objectList = result?["doods"]
        
        for doodObj in (objectList as? Array<Any>)! {
            var doodDict = doodObj as? [String: AnyObject]
            
            let doodImgString = doodDict?["image"] as? String
            let doodName = doodDict?["name"] as? String
            let doodID = doodDict?["id"] as? String
            
            let doodImgURL = URL(string: doodImgString!)
            let doodImgData = try? Data(contentsOf: doodImgURL!)
            let doodUIImage = UIImage(data: doodImgData!)
            
            let cellObject = Cell(id: doodID!, name: doodName!, imageURL: doodUIImage!)
            //self.tableView.reloadData()
            cells.append(cellObject!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //print("numberOfSections called...")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print("numberOfRows called...\(cells.count)")
        return cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell", for: indexPath) as? IndexTableViewCell else {
            fatalError("The dequeued cell is not an instance of IndexTableViewCell")
        }

        // Configure the cell...
        let cell = cells[indexPath.row]

        tableCell.nameLabel.text = cell.nameLabel
        tableCell.imageURL.image = cell.imageURL

        return tableCell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
