//
//  ViewController.swift
//  HitList
//
//  Created by DIAKO on 6/12/20.
//  Copyright © 2020 Diako. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        names.append("hi")
        title = "The List"
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func addName(_ sender: Any) {
        let alert = UIAlertController(title:"New Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                return
            }
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true)
        
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    
}
