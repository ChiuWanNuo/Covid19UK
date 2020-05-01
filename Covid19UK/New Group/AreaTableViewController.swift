//
//  AreaTableViewController.swift
//  Covid19UK
//
//  Created by ChiuWanNuo on 26/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    
    var vriusArea = [AreaData.Area]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArea()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vriusArea.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath) as! AreaTableViewCell
        let areadata = vriusArea[indexPath.row]
        
        let locationname = areadata.location
        let locationnumber = areadata.number
        
        cell.areanameLabel.text = "\(locationname)" + ":"
        cell.areanumberLabel.text = "\(locationnumber)"

        return cell
    }
    
    func getArea() {
        let urlStr = "https://api.covid19uk.live"
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .millisecondsSince1970
                if let data = data, let areadata = try?decoder.decode(AreaData.self, from: data) {
                    self.vriusArea = areadata.data[0].area
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }
            task.resume()
        }
        
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
