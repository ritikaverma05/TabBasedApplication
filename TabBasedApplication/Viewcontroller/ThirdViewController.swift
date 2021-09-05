//
//  ThirdViewController.swift
//  TabBasedApplication
//
//  Created by RITIKA VERMA on 03/09/21.
//

import UIKit

struct Model {
    let name: String!
    let imageName: String!
     
}

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var superTableView: UITableView!
    var candyModel = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){

        superTableView.register(UINib(nibName: "superTableViewCell", bundle: nil), forCellReuseIdentifier: "superTableViewCell")
        
        candyModel.append(Model(name: "Lindt", imageName: "Lindt"))
        candyModel.append(Model(name: "Lollipop", imageName: "Lollipop"))
        candyModel.append(Model(name: "Macaron", imageName: "Macaron"))
        candyModel.append(Model(name: "Hany", imageName: "Hany"))
        candyModel.append(Model(name: "Chupa Chups", imageName: "Chupa Chups"))
        candyModel.append(Model(name: "Jelly Tots", imageName: "Jelly Tots"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "superTableViewCell", for: indexPath) as! superTableViewCell
        cell.configure(with: candyModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

