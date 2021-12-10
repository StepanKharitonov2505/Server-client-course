//
//  GroupsController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 10.11.2021.
//

import UIKit

class GroupsController: UITableViewController {
    
    var myGroups1 = [String]()
    
    var avatarGroup: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups1.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroups", for: indexPath) as? GroupsCellController else {
            return UITableViewCell()
        }
        
        let mygroups = myGroups1[indexPath.row]
        cell.myGroupsCell.text = mygroups
        
        cell.myImageGroupsCell.image = UIImage(named: mygroups)
        cell.myImageGroupsCell.layer.cornerRadius = cell.myImageGroupsCell.frame.height/2
        cell.myImageGroupsCell.contentMode = .scaleAspectFill
        
        if UIImage(named: mygroups) == nil {
            cell.myImageGroupsCell.image = UIImage(named: "PhotoNil")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups1.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    @IBAction func addGroups(segue: UIStoryboardSegue){
        if segue.identifier == "addGroupsSegue" {
            guard let searchGroup = segue.source as? SearchGroupsController else {
                return
            }
        
        if let indexPath = searchGroup.tableView.indexPathForSelectedRow {
            let group = searchGroup.filterGroups[indexPath.row]
            if !myGroups1.contains(group.name) {
                myGroups1.append(group.name)
                tableView.reloadData()
          }
        }
      }
    }
    
}
