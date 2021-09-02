//
//  DetailViewController.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 01/09/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var candyImage: UIImageView!
    @IBOutlet weak var candyLabel: UILabel!
    
    var itemImg:UIImage!
    var itemName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        self.navigationItem.title = itemName
        candyImage.image = itemImg
        candyLabel.text = itemName
    }
    
}
