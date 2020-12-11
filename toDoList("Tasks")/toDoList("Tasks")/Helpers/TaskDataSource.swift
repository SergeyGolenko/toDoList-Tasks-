//
//  TaskDataSource.swift
//  toDoList("Tasks")
//
//  Created by Сергей Голенко on 10.12.2020.
//  Copyright © 2020 Sergey Golenko. All rights reserved.
//

import Foundation

class TaskDataSource{
    var tasks = [[Task](),[Task]()]

//Add tasks
    func add(_ task: Task,at index: Int,isDone: Bool = false){
        let section = isDone ? 1 : 0
        tasks[section].insert(task, at: index)
    }
    
    
    
//Remove tasks
    func removeTask(at index: Int,isDone: Bool = false) -> Task {
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }

}
