//
//  superTableViewCell.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 03/09/21.
//

import UIKit

class superTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    
    
    @IBOutlet var subCollectionView: UICollectionView!
    var models = [Model]()

    override func awakeFromNib() {
        super.awakeFromNib()
        subCollectionView.register(UINib(nibName: "subCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "subCollectionViewCell")
        subCollectionView.dataSource = self
        subCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCollectionViewCell", for: indexPath) as! subCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func configure(with models: [Model]) {
        self.models = models
        subCollectionView.reloadData()
    }
    
}
