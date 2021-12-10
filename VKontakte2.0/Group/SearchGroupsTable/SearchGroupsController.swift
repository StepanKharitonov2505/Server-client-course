//
//  SearchGroupsController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 10.11.2021.
//

import UIKit

class SearchGroupsController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var newGroups = GroupRepository()
    var filterGroups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchBar.delegate = self
        filterGroups = newGroups.groupBlock
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showNewGroups", for: indexPath) as? SearchGroupsCellController else {
            return UITableViewCell()
        }

        let groups = filterGroups[indexPath.row]
        cell.searchGroupCell.text = groups.name
        
        cell.searchImageCell.layer.cornerRadius = cell.searchImageCell.frame.height/2
        cell.searchImageCell.contentMode = .scaleAspectFill
        cell.searchImageCell.image = UIImage(named: groups.imagename)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.searchImageCell.isUserInteractionEnabled = true
        cell.searchImageCell.addGestureRecognizer(tapGestureRecognizer)
        
        if UIImage(named: groups.name) == nil {
            cell.searchImageCell.image = UIImage(named: "PhotoNil")
        }
        
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterGroups = []
        if searchText == "" {
            filterGroups = newGroups.groupBlock
        } else {
            for searchgroup in newGroups.groupBlock {
                if searchgroup.name.lowercased().contains(searchText.lowercased()){
                    filterGroups.append(searchgroup)
                }
            }
        }
        self.tableView.reloadData()
    }

    // MARK: @Objc
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
        {
            guard let tappedImage = tapGestureRecognizer.view as? UIImageView else {
                return
            }
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    tappedImage.layer.cornerRadius = tappedImage.frame.height/2
                    tappedImage.bounds.size = CGSize(width: 85, height: 85)
                },
                completion: nil)
        }
    
}
