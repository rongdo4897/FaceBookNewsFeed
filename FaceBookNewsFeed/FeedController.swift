//
//  ViewController.swift
//  FaceBookNewsFeed
//
//  Created by Hoang Tung Lam on 10/19/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import UIKit

let cellId = "cellId"

class Post {
    var name:String?
    var statusText:String?
    var statusImage:String?
    var profileImage:String?
}

class FeedController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post1 = Post()
        post1.name = "User Profile 1"
        post1.statusText = "Meanwhile , Beast turned to the dark side 1"
        post1.statusImage = "corgi"
        post1.profileImage = "u1"
        posts.append(post1)
        let post2 = Post()
        post2.name = "User Profile 2"
        post2.statusText = "Meanwhile , Beast turned to the dark side 2 , Meanwhile , Beast turned to the dark side 2"
        post2.statusImage = "1"
        post2.profileImage = "u2"
        posts.append(post2)
        let post3 = Post()
        post3.name = "User Profile 3"
        post3.statusText = "Meanwhile , Beast turned to the dark side 3 , Meanwhile , Beast turned to the dark side 3 , Meanwhile , Beast turned to the dark side 3"
        post3.statusImage = "2"
        post3.profileImage = "u3"
        posts.append(post3)
        let post4 = Post()
        post4.name = "User Profile 4"
        post4.statusText = "Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4, Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4 , Meanwhile , Beast turned to the dark side 4"
        post4.statusImage = "3"
        post4.profileImage = "u4"
        posts.append(post4)
        let post5 = Post()
        post5.name = "User Profile 5"
        post5.statusText = "Meanwhile , Beast turned to the dark side 5"
        post5.statusImage = "4"
        post5.profileImage = "u5"
        posts.append(post5)
        let post6 = Post()
        post6.name = "User Profile 6"
        post6.statusText = "Meanwhile , Beast turned to the dark side 6"
        post6.statusImage = "5"
        post6.profileImage = "u6"
        posts.append(post6)
        
        
        navigationItem.title = "Facebook Feed"
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.alwaysBounceVertical = true
//        collectionView.alwaysBounceHorizontal = true
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        
        cell.post = posts[indexPath.row]
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = posts[indexPath.row].statusText{
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knowHeight:CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            
            return CGSize(width: view.frame.width, height: rect.height + knowHeight + 20 + CGFloat(statusText.count / 10))
        }
        return CGSize(width: view.frame.width, height: 500)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

class FeedCell: UICollectionViewCell {
    
    var post:Post?{
        didSet{
            
            if let name = post?.name{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
                attributedText.append(NSMutableAttributedString(string: "\nDecember 18 . San Fransico . ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]))
                
                // tao khoang trang giua cac dong
                let  paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                
                nameLable.attributedText = attributedText
            }
            
            if let statusText = post?.statusText{
                statusTextView.text = statusText
            }
            
            if let statusImg = post?.statusImage{
                statusImage.image = UIImage(named: statusImg)
            }
            
            if let profileImg = post?.profileImage{
                imgProfile.image = UIImage(named: profileImg)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // nameLable
    let nameLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    // imgProfile
    let imgProfile:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // status
    let statusTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Meanwhile , Beast turned to the dark side"
        textView.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    // status image
    let statusImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "corgi")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    // like and comment
    let likeCommentLable:UILabel = {
        let likeLable = UILabel()
        likeLable.text = "480 Likes   10.7K Comments"
        likeLable.font = UIFont.systemFont(ofSize: 12)
        likeLable.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return likeLable
    }()
    
    // view line
    let dividerViewLine:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    //button like
    let likeButton:UIButton = {
        return buttonForTitle(title: "Like", imageName: "icons8-facebook-like-50")
    }()
    
    // button comment
    let commentButton:UIButton = {
        return buttonForTitle(title: "Comment", imageName: "icons8-comments-50")
    }()
    
    // button share
    let shareButton:UIButton = {
        return buttonForTitle(title: "Share", imageName: "icons8-share-50")
    }()
    
    static func buttonForTitle(title:String,imageName:String) -> UIButton {
        let btnlike = UIButton()
        btnlike.setTitle(title, for: .normal)
        btnlike.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .normal)
        btnlike.setImage(UIImage(named: imageName), for: .normal)
        btnlike.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0)
        btnlike.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return btnlike
    }
    
    // setUp cell
    func setUpView(){
        backgroundColor = UIColor.white
        // add subview into cell
        addSubview(nameLable)
        addSubview(imgProfile)
        addSubview(statusTextView)
        addSubview(statusImage)
        addSubview(likeCommentLable)
        addSubview(dividerViewLine)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        // add constraints Hoz (chieu doc)
        addConstranintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: imgProfile , nameLable)
        addConstranintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstranintsWithFormat(format: "H:|[v0]|", views: statusImage)
        addConstranintsWithFormat(format: "H:|-12-[v0]|", views: likeCommentLable)
        addConstranintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerViewLine)
        addConstranintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton , commentButton , shareButton)
        
        // add constraints Ver (chieu ngang)
        addConstranintsWithFormat(format: "V:|-12-[v0]", views: nameLable)
        addConstranintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.4)]-8-[v5(44)]|", views: imgProfile , statusTextView , statusImage , likeCommentLable , dividerViewLine , likeButton)
        addConstranintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstranintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
}

extension UIView {
    func addConstranintsWithFormat(format:String , views:UIView...) {
        // create value type Dictionary
        var viewDictionary = [String : UIView]()
        for (index,view) in views.enumerated() {
            // get key
            let key = "v\(index)"
            // get value by key
            viewDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}
