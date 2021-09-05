//
//  subCollectionViewCell.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 03/09/21.
//

import UIKit

class subCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var candyImageCV: UIImageView!
    @IBOutlet weak var candyNameCV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.candyImageCV.clipsToBounds = true
        self.candyImageCV.layer.cornerRadius = 50
        // Initialization code
    }
    
    public func configure(with model: Model){
        self.candyNameCV.text = model.name
        self.candyImageCV.image = UIImage(named: model.imageName!)
    }

}
