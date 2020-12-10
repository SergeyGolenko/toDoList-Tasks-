//
//  TaskTableViewController.swift
//  toDoList("Tasks")
//
//  Created by Sergey Golenko on 09.12.2020.
//  Copyright © 2020 Sergey Golenko. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    let color = CGColor(srgbRed: 38, green: 166, blue: 255, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.1615069807, green: 0.7159221768, blue: 1, alpha: 1)
        
    }
    // MARK: - Table view data source
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 50    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "100$"
        return cell
    }

  

}

