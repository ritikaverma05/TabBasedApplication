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
        return candyName.count
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.itemName = candyName[indexPath.row]
        detailVC.itemImg = candyImage[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            candyName.remove(at: indexPath.row)
            candyImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0                              //set initial cell
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1.0) {         //Final set cell animation
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }

}
