//
//  CardCell.swift
//  dropdown-sport-app
//
//  Created by Ha Duyen Quang Huy on 05/11/2022.
//

import UIKit

class CardCell: UITableViewCell {
    
    var cellData: CellData! {
        
        didSet {
            featureImage.image = cellData.featureImage
            titleLabel.text = cellData.title
           
        }
    }
    
    fileprivate var imageHeightOpened: NSLayoutConstraint!
    fileprivate var imageHeightClosed: NSLayoutConstraint!
    
    fileprivate lazy var featureImage: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 2
        return iv
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var infoText: UITextView = {
       
        let infoTxt = UITextView()
        infoTxt.font = UIFont.systemFont(ofSize: 12, weight: .light)
        infoTxt.isEditable = false
        infoTxt.textColor = .black
        infoTxt.translatesAutoresizingMaskIntoConstraints = false
        infoTxt.text = "This series will show you how to build a dropdown spots app."
        infoTxt.backgroundColor = .clear
        
        return infoTxt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        backgroundColor = .clear
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        
        contentView.addSubview(featureImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoText)
        
        featureImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        featureImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        featureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
//        featureImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageHeightOpened = featureImage.heightAnchor.constraint(equalToConstant: 180)
        imageHeightClosed = featureImage.heightAnchor.constraint(equalToConstant: 20)
        
        titleLabel.topAnchor.constraint(equalTo: featureImage.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        infoText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -4).isActive = true
        infoText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        infoText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        infoText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
    }
    
    func animate() {
        imageHeightOpened.isActive = false
        imageHeightClosed.isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.imageHeightOpened.isActive = true
            self.imageHeightClosed.isActive = false
            
            UIView.animate(withDuration: 0.3, delay: 0.15, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.contentView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
