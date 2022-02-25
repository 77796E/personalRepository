//
//  DetailWeatherVC.swift
//  weather_demo
//
//  Created on 2022/2/23.
//

import UIKit
class DetailWeatherVC: UITableViewController {


    
    var 经度: Double = 0
    var 纬度: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("数据如下")
//        for i in 0...23 {
//            print(detailData[i].Dicon)
//            print("\n")
//        }
        //print("经度 纬度: \(经度) \(纬度)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 规定有几行
        
        return detailData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellID", for: indexPath) as! DetailCell
        
        cell.iconImage.image = UIImage(named: "\(detailData[indexPath.row].Dicon)_")
        
        cell.tempLabel.text = "\(detailData[indexPath.row].Dtemp)°C"
        cell.timeLabel.text = detailData[indexPath.row].Dtime
        cell.weatherTextLabel.text = detailData[indexPath.row].Dtext
        
        return cell
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
