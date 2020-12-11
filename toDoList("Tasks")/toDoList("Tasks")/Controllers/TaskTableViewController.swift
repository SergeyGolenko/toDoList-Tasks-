//
//  TaskTableViewController.swift
//  toDoList("Tasks")
//
//  Created by Sergey Golenko on 09.12.2020.
//  Copyright © 2020 Sergey Golenko. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var taskStore : TaskDataSource!
    
    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add task", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let name = alertController.textFields?.first?.text else {return}
            //Create task
            let newTask = Task(name: name)
            self.taskStore.add(newTask, at: 0)
            //reload data
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with:.bottom)
            
        }
        addAction.isEnabled = false
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter task..."
            textField.addTarget(self, action: #selector(self.handleTextChanged), for: .editingChanged)
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc func handleTextChanged(_ sender:UITextField){
        guard let alertController = presentedViewController as? UIAlertController,
              let addAction = alertController.actions.first,
              let text = sender.text
        else {return}
        
        addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    
    let color = CGColor(srgbRed: 38, green: 166, blue: 255, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = #colorLiteral(red: 0.1615069807, green: 0.7159221768, blue: 1, alpha: 1)
        
        
        
    }
    // MARK: - Table view data source
    
   
    
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
    
    //MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        deleteAction.image = #imageLiteral(resourceName: "delete")
        deleteAction.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, completionHandler) in
            
            self.taskStore.tasks[0][indexPath.row].isDone = true
            let doneTask = self.taskStore.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.taskStore.add(doneTask, at: 0, isDone: true)
            tableView.insertRows(at: [IndexPath(row: 0,section: 1)],with: .automatic)
            completionHandler(true)
        }
        doneAction.image = #imageLiteral(resourceName: "done")
        doneAction.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
  

}

