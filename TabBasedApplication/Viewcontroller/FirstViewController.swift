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
        tableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0                              //set initial cell
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1.0) {         //Final set cell animation
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit"){ _, _, _ in
            print("edit button tapped")
        }
        let delete = UIContextualAction(style: .destructive, title: "Delete"){ _, _, _ in
            print("delete button tapped")
            self.candyName.remove(at: indexPath.row)
            self.candyImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let swipeConfig = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipeConfig
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let more = UIContextualAction(style: .normal, title: "More"){ _, _, _ in
            print("more button tapped")
        }
        more.backgroundColor = .systemBlue
        let swipeConfig = UISwipeActionsConfiguration(actions: [more])
        return swipeConfig
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 80
        }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! MyCustomHeader
        if(section == 0){
            view.image.image = #imageLiteral(resourceName: "candyHeader")
        }else{
            view.image.image = #imageLiteral(resourceName: "chocolateTitle")
        }
       return view
    }

    
}

class MyCustomHeader: UITableViewHeaderFooterView {
    
    let image = UIImageView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        image.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(image)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 80),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
