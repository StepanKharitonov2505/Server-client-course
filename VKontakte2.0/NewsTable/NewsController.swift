//
//  NewsController.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 24.11.2021.
//

import UIKit

class NewsController: UITableViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    var news = NewsRepository()
    var didAnimateCell = [IndexPath: Bool]()
    var imageUserSelect = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfNews()
        registerCustomCell()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if didAnimateCell[indexPath] == nil || didAnimateCell[indexPath]! == false {
                didAnimateCell[indexPath] = true
//            if indexPath.row != 0 {
//                TipInCellAnimator.animate(cell: cell)
//            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.newsBlock.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsCustomCell", for: indexPath) as? NewsCustomCell else {
            return UITableViewCell()
        }
        
        let indexImage = imageUserSelect[indexPath.row]
    
        // MARK: Tuning Cell
        cell.mainNewsView.layer.cornerRadius = 25
        let newsRow = news.newsBlock[indexPath.row]
        cell.groupName.text = newsRow.groups.name
        cell.avatarGroup.image = UIImage(named: newsRow.groups.imagename)
        cell.avatarGroup.layer.cornerRadius = cell.avatarGroup.frame.height/2
        cell.avatarGroup.contentMode = .scaleAspectFill
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                cell.avatarGroup.isUserInteractionEnabled = true
                cell.avatarGroup.addGestureRecognizer(tapGestureRecognizer)
        cell.shadowViewAvatarGroup.layer.cornerRadius = cell.avatarGroup.layer.cornerRadius
        cell.themePublishing.text = newsRow.thematicsNews.description
        cell.timePublishing.text = newsRow.time
        cell.datePublishing.text = newsRow.date
        cell.newsTextContent.text = newsRow.textContentPost
        cell.textAndLikeView.layer.cornerRadius = 15
        cell.newsImageView.image = newsRow.imageContentPost[indexImage]
        
        
        if didAnimateCell[indexPath] == nil || didAnimateCell[indexPath]! == false {
            newsRow.viewsNumber = 0
        } else {
            newsRow.viewsNumber = 1
        }
        cell.viewsUsers.text = String(describing: newsRow.viewsNumber)
        
        // MARK: addTarget and Tag
        cell.likeButton.addTarget(self, action: #selector(likeButtonPressed(sender:)), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        cell.commentButton.addTarget(self, action: #selector(commentButtonPressed(sender:)), for: .touchUpInside)
        cell.commentButton.tag = indexPath.row
        cell.shareButton.addTarget(self, action: #selector(shareButtonPressed(sender:)), for: .touchUpInside)
        cell.shareButton.tag = indexPath.row
        cell.buttonNext.addTarget(self, action: #selector(buttonNextAction(sender:)), for: .touchUpInside)
        cell.buttonNext.tag = indexPath.row
        cell.buttonDown.addTarget(self, action: #selector(buttonDownAction(sender:)), for: .touchUpInside)
        cell.buttonDown.tag = indexPath.row
        
        if newsRow.isLiked == false {
            cell.likeNumber.text = "0"
            cell.likeNumber.textColor = .white
            cell.likeButton.tintColor = .white
        } else {
            cell.likeNumber.text = "1"
            cell.likeNumber.textColor = .red
            cell.likeButton.tintColor = .red
        }
        
        if newsRow.isComment == false {
            cell.commentNumber.text = "0"
            cell.commentNumber.textColor = .white
            cell.commentButton.tintColor = .white
        } else {
            cell.commentNumber.text = "1"
            cell.commentNumber.textColor = .red
            cell.commentButton.tintColor = .red
        }
        
        if newsRow.isShared == false {
            cell.shareNumber.text = "0"
            cell.shareNumber.textColor = .white
            cell.shareButton.tintColor = .white
        } else {
            cell.shareNumber.text = "1"
            cell.shareNumber.textColor = .red
            cell.shareButton.tintColor = .red
        }
        
        if indexImage == 0 {
            cell.buttonDown.layer.opacity = 0
            cell.buttonDown.isEnabled = false
        } else {
            cell.buttonDown.layer.opacity = 1
            cell.buttonDown.isEnabled = true
        }
        
        if indexImage == (newsRow.imageContentPost.count-1) {
            cell.buttonNext.layer.opacity = 0
            cell.buttonNext.isEnabled = false
        } else {
            cell.buttonNext.layer.opacity = 1
            cell.buttonNext.isEnabled = true
        }
        
        // MARK: Gradient MainViewNews
        let myGradient = CAGradientLayer()
        myGradient.colors = [UIColor.purple.cgColor, UIColor.clear]
        myGradient.locations = [ 0 as NSNumber, 0.6 as NSNumber]
        myGradient.startPoint = CGPoint.init(x: 0, y: 0)
        myGradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        cell.mainNewsView.layer.insertSublayer(myGradient, at: 0)
        cell.mainNewsView.clipsToBounds = true
        myGradient.frame = cell.mainNewsView.bounds
        myGradient.opacity = 1
        
        // MARK: Gradient ButtonNext
        let myGradientButtonNext = CAGradientLayer()
        myGradientButtonNext.colors = [UIColor.clear, UIColor.black.cgColor]
        myGradientButtonNext.locations = [ 0 as NSNumber, 1 as NSNumber]
        myGradientButtonNext.startPoint = CGPoint.init(x: 0, y: 0)
        myGradientButtonNext.endPoint = CGPoint(x: 0.0, y: 1.0)
        cell.buttonNext.layer.insertSublayer(myGradientButtonNext, at: 0)
        cell.buttonNext.clipsToBounds = true
        myGradientButtonNext.frame = cell.buttonNext.bounds
        myGradientButtonNext.opacity = 0.2
        
        // MARK: Gradient ButtonDown
        let myGradientButtonDown = CAGradientLayer()
        myGradientButtonDown.colors = [UIColor.clear, UIColor.black.cgColor]
        myGradientButtonDown.locations = [ 0 as NSNumber, 1 as NSNumber]
        myGradientButtonDown.startPoint = CGPoint.init(x: 0, y: 0)
        myGradientButtonDown.endPoint = CGPoint(x: 0.0, y: 1.0)
        cell.buttonDown.layer.insertSublayer(myGradientButtonDown, at: 0)
        cell.buttonDown.clipsToBounds = true
        myGradientButtonDown.frame = cell.buttonDown.bounds
        myGradientButtonDown.opacity = 0.2
       
        // MARK: Shadow AvatarGroup
        cell.shadowViewAvatarGroup.layer.shadowColor = UIColor.black.cgColor
        cell.shadowViewAvatarGroup.layer.shadowOpacity = 0.7
        cell.shadowViewAvatarGroup.layer.shadowOffset = CGSize.zero
        cell.shadowViewAvatarGroup.layer.shadowRadius = 5
        
        // MARK: Shadow textAndLikeView
        cell.textAndLikeView.layer.shadowColor = UIColor.black.cgColor
        cell.textAndLikeView.layer.shadowOpacity = 0.7
        cell.textAndLikeView.layer.shadowOffset = CGSize.zero
        cell.textAndLikeView.layer.shadowRadius = 5
    
        return cell
    }
    
    // MARK: Func
    func numberOfNews() {
        var n = 0
        while n < news.newsBlock.count {
            let news1 = 0
            imageUserSelect.append(news1)
            n += 1
        }
    }
    
    // MARK: Privat func
    private func registerCustomCell() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: "customViewCell", bundle: nil), forCellReuseIdentifier: "NewsCustomCell")
    }
    
    // MARK: @Objc
    @objc func buttonNextAction(sender: UIButton) {
        let buttonTag = sender.tag
        imageUserSelect[buttonTag] += 1
        tableView.reloadData()
        }
    @objc func buttonDownAction(sender: UIButton) {
        let buttonTag = sender.tag
        imageUserSelect[buttonTag] -= 1
        tableView.reloadData()
        }
    @objc func likeButtonPressed(sender: UIButton) {
        let likeButtonTag = sender.tag
        if news.newsBlock[likeButtonTag].isLiked == false {
        news.newsBlock[likeButtonTag].isLiked = true
        } else {
            news.newsBlock[likeButtonTag].isLiked = false
        }
        tableView.reloadData()
    }
    @objc func commentButtonPressed(sender: UIButton) {
        let commentButtonTag = sender.tag
        if news.newsBlock[commentButtonTag].isComment == false {
            news.newsBlock[commentButtonTag].isComment = true
        } else {
            news.newsBlock[commentButtonTag].isComment = false
        }
        tableView.reloadData()
    }
    @objc func shareButtonPressed(sender: UIButton) {
        let shareButtonTag = sender.tag
        if news.newsBlock[shareButtonTag].isShared == false {
            news.newsBlock[shareButtonTag].isShared = true
        } else {
            news.newsBlock[shareButtonTag].isShared = false
        }
        tableView.reloadData()
    }
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




//@objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//        guard let tappedImage = tapGestureRecognizer.view as? UIImageView else {
//            return
//        }
//        UIView.animate(
//            withDuration: 1,
//            delay: 0,
//            usingSpringWithDamping: 0.5,
//            initialSpringVelocity: 1,
//            options: [],
//            animations: {
//                tappedImage.layer.cornerRadius = tappedImage.frame.height/2
//                tappedImage.bounds.size = CGSize(width: 85, height: 85)
//            },
//            completion: nil)
//    }
