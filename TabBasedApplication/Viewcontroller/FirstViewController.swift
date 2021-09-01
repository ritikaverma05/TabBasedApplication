//
//  FirstViewController.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 01/09/21.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var candyImage = [#imageLiteral(resourceName: "Chocolate truffle"),#imageLiteral(resourceName: "Chupa Chups"),#imageLiteral(resourceName: "Dumle"),#imageLiteral(resourceName: "Flat Tops"),#imageLiteral(resourceName: "Garoto"),#imageLiteral(resourceName: "Gummi bears"),#imageLiteral(resourceName: "Hanukkah gelt"),#imageLiteral(resourceName: "Hany"),#imageLiteral(resourceName: "Hershey Bar"),#imageLiteral(resourceName: "Jelly Tots"),#imageLiteral(resourceName: "Jolly Rancher"),#imageLiteral(resourceName: "Kit Kat"),#imageLiteral(resourceName: "Lindt"),#imageLiteral(resourceName: "Macaron"),#imageLiteral(resourceName: "Pâte de fruits"),#imageLiteral(resourceName: "Polkagris"),#imageLiteral(resourceName: "Salmiakki"),#imageLiteral(resourceName: "Snickers"),#imageLiteral(resourceName: "Twizzlers"),#imageLiteral(resourceName: "Chupa Chups")]
    var candyName = ["Chocolate truffle", "Chupa Chups", "Dumle", "Flat Tops", "Garoto", "Gummi bears", "Hanukkah gelt", "Hany", "Hershey Bar", "Jelly Tots", "Jolly Rancher", "Kit Kat", "Lindt", "Lollipop", "Macaron", "Pâte de fruits", "Polkagris", "Salmiakki", "Snickers", "Twizzlers"]
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
        cell.nameLabel.text = candyName[indexPath.row]
        cell.itemImage.image = candyImage[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
