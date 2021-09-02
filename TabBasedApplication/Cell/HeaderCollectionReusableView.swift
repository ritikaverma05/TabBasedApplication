//
//  HeaderCollectionReusableView.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 02/09/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView{
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "candyHeader"))
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    

    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
