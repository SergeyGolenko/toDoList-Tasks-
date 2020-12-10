//
//  TaskTableViewController.swift
//  toDoList("Tasks")
//
//  Created by Sergey Golenko on 09.12.2020.
//  Copyright © 2020 Sergey Golenko. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var taskStore = TaskDataSource()
    
    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add task", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter task..."
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    let color = CGColor(srgbRed: 38, green: 166, blue: 255, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.1615069807, green: 0.7159221768, blue: 1, alpha: 1)
        
        let toDoTask = [Task(name: "Medetete"),Task(name: "Buy bananas")]
        let doneTasks = [Task(name: "watch TV",isDone: true)]
        taskStore.tasks = [toDoTask,doneTasks]
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "ToDo":"Done"  //это тернарный оператор
    }
  

    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell
    }

  

}

