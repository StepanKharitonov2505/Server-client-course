//
//  GroupsController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 10.11.2021.
//

import UIKit
import SDWebImage

class GroupsController: UITableViewController {
    
    private var groupsAPI = GroupsApiMethods()
    private var groupsAPIArray: [Groups] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsAPI.getGroups { [weak self] groupsAPIArray in
            guard let self = self else { return }
            
            self.groupsAPIArray = groupsAPIArray
            self.tableView.reloadData()
        }

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsAPIArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroups", for: indexPath) as? GroupsCellController else {
            return UITableViewCell()
        }
        
        let mygroups = groupsAPIArray[indexPath.row]
        cell.myGroupsCell.text = mygroups.name
        
        cell.myImageGroupsCell.sd_setImage(with: URL.init(string: mygroups.photoMaxOrig), completed: nil)
        cell.myImageGroupsCell.layer.cornerRadius = cell.myImageGroupsCell.frame.height/2
        cell.myImageGroupsCell.contentMode = .scaleAspectFill
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupsAPIArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    @IBAction func addGroups(segue: UIStoryboardSegue){
//        if segue.identifier == "addGroupsSegue" {
//            guard let searchGroup = segue.source as? SearchGroupsController else {
//                return
//            }
//        
//        if let indexPath = searchGroup.tableView.indexPathForSelectedRow {
//            let group = searchGroup.searchGroupsAPIArray[indexPath.row]
//            if groupsAPIArray.contains(where: { $0.name == group.name }) {
//                
//                let newsElement = Groups.init(isMember: group.isMember,
//                            id: group.id,
//                            isAdvertiser: group.isAdvertiser,
//                            isAdmin: group.isAdmin,
//                            photoMaxOrig: group.photoMaxOrig,
//                            type: nil,
//                            screenName: group.screenName,
//                            name: group.name,
//                            isClosed: group.isClosed)
//                groupsAPIArray.append(newsElement)
//                tableView.reloadData()
//          }
//        }
//      }
    }
    
}
