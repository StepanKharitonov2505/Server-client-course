//
//  SearchGroupsController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 10.11.2021.
//

import UIKit
import SDWebImage

class SearchGroupsController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    private var searchGroupsAPI = SearchGroupsApiMethods()
    var searchGroupsAPIArray: [SearchGroups] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySearchBar.delegate = self
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchGroupsAPIArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showNewGroups", for: indexPath) as? SearchGroupsCellController else {
            return UITableViewCell()
        }

        let groups = searchGroupsAPIArray[indexPath.row]
        cell.searchGroupCell.text = groups.name
        
        cell.searchImageCell.layer.cornerRadius = cell.searchImageCell.frame.height/2
        cell.searchImageCell.contentMode = .scaleAspectFill
        cell.searchImageCell.sd_setImage(with: URL.init(string: groups.photoMaxOrig), completed: nil)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.searchImageCell.isUserInteractionEnabled = true
        cell.searchImageCell.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchGroupsAPIArray = []
        } else {
            searchGroupsAPI.getGroupsSearch(searchName: searchText) { [weak self] searchGroupsAPIArray in
                guard let self = self else { return }
                self.searchGroupsAPIArray = searchGroupsAPIArray
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
