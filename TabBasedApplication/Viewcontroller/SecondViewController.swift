//
//  SecondViewController.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 01/09/21.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var candyImage = [#imageLiteral(resourceName: "Chocolate truffle"),#imageLiteral(resourceName: "Chupa Chups"),#imageLiteral(resourceName: "Dumle"),#imageLiteral(resourceName: "Flat Tops"),#imageLiteral(resourceName: "Garoto"),#imageLiteral(resourceName: "Gummi bears"),#imageLiteral(resourceName: "Hanukkah gelt"),#imageLiteral(resourceName: "Hany"),#imageLiteral(resourceName: "Hershey Bar"),#imageLiteral(resourceName: "Jelly Tots"),#imageLiteral(resourceName: "Jolly Rancher"),#imageLiteral(resourceName: "Kit Kat"),#imageLiteral(resourceName: "Lindt"),#imageLiteral(resourceName: "Macaron"),#imageLiteral(resourceName: "Pâte de fruits"),#imageLiteral(resourceName: "Polkagris"),#imageLiteral(resourceName: "Salmiakki"),#imageLiteral(resourceName: "Snickers"),#imageLiteral(resourceName: "Twizzlers"),#imageLiteral(resourceName: "Chupa Chups")]
    var candyName = ["Chocolate truffle", "Chupa Chups", "Dumle", "Flat Tops", "Garoto", "Gummi bears", "Hanukkah gelt", "Hany", "Hershey Bar", "Jelly Tots", "Jolly Rancher", "Kit Kat", "Lindt", "Lollipop", "Macaron", "Pâte de fruits", "Polkagris", "Salmiakki", "Snickers", "Twizzlers"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SecondCollectionViewCell")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return candyName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        cell.itemTitle.text = candyName[indexPath.row]
        cell.itemImageView.image = candyImage[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.itemName = candyName[indexPath.row]
        detailVC.itemImg = candyImage[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.width/6)
    }
    
}


