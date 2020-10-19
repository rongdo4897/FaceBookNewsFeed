//
//  ViewController.swift
//  FaceBookNewsFeed
//
//  Created by Hoang Tung Lam on 10/19/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import UIKit

let cellId = "cellId"

class FeedController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Facebook Feed"
        
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.alwaysBounceVertical = true
//        collectionView.alwaysBounceHorizontal = true
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

class FeedCell: UICollectionViewCell {
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
        let attributedText = NSMutableAttributedString(string: "User Profile", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: "\nDecember 18 . San Fransico . ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]))
        
        // tao khoang trang giua cac dong
        let  paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        label.attributedText = attributedText
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
        addConstranintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-[v4(0.4)]-8-[v5(44)]|", views: imgProfile , statusTextView , statusImage , likeCommentLable , dividerViewLine , likeButton)
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
