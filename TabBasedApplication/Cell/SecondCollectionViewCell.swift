//
//  SecondCollectionViewCell.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 01/09/21.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemContainerView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.itemContainerView.clipsToBounds = true
        self.itemContainerView.layer.cornerRadius = 10
        // Initialization code
    }

}
