//
//  TableViewController.swift
//  SVGDemo
//
//  Created by 胡智林 on 2019/2/18.
//  Copyright © 2019 胡智林. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let datas = [["使用webview",
                  "使用SVGKit",
                  "使用Macaw"],
                 ["显示颜色不对",
                  "滤镜效果不显示"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.clearsSelectionOnViewWillAppear = false
        title = "svg使用"
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "显示svg图片的方式"
        } else {
            return "使用SVGKit遇到问题"
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var VC: UIViewController?
        if indexPath.section == 0 {
            
            
            switch indexPath.row {
            case 0:
                VC = WebviewViewController()
            case 1:
                VC = SVGKitViewController()
            case 2:
                VC = MacawViewController()
            default:
                print("")
            }
        } else {
            switch indexPath.row {
            case 0:
                VC = ColorViewController()
            case 1:
                VC = FilterViewController()
            default:
                print("")
            }
            
        }
        
        if let vc = VC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.textLabel?.text = datas[indexPath.section][indexPath.row]

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
