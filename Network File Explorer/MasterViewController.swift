//
//  MasterViewController.swift
//  Network File Explorer
//
//  Created by Mohammad Assad on 26/9/2019.
//  Copyright © 2019 Mohammad Assad. All rights reserved.
//

import UIKit
import SwiftEventBus



class MasterViewController: UITableViewController{
    
    

    
    var detailViewController: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addConn))

         self.navigationItem.rightBarButtonItem = add
        
         
       
         
    }

    @objc func addConn(sender: UITapGestureRecognizer){
        
        //show add new connection screen
        print("func called");
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        if(section == 0){
         
            return 2
        }
        else{
        
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if(section == 1){
        
            return "Network Connections"
        }
        
        
        return ""
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
       
        SwiftEventBus.post("masterCellClicked", sender: PathType(pathType: (cell?.textLabel!.text)!))
    
        //deselect row immediately
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "showDetail" {
               if let indexPath = tableView.indexPathForSelectedRow {
                   let controller = (segue.destination as! UINavigationController).topViewController as! ViewController
                   controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                   controller.navigationItem.leftItemsSupplementBackButton = true
                   
                   controller.descLabel.text = String(indexPath.row)
                   detailViewController = controller
                   
               }
           }
       }
    
    
    override func tableView(
      _ tableView: UITableView,
      cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            switch indexPath.section {
            
            case 0:
                if(indexPath.row == 0){
                    cell.textLabel?.text = "Local"
                }
                else{
                    cell.textLabel?.text = "Photo Album"
                }
                break;
            default:
                cell.textLabel?.text = "Not available right now"
            }
            
            
      return cell
    }

   
}
