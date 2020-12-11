//
//  TasksUtility.swift
//  toDoList("Tasks")
//
//  Created by Сергей Голенко on 11.12.2020.
//  Copyright © 2020 Sergey Golenko. All rights reserved.
//

import Foundation


class TasksUtility{
    
    private static let key = "tasks"
    
    //archive
    private static func archive(_ task: [[Task]]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: task) as NSData
    }
    
    //fetch
    static func fetch() -> [[Task]]? {
        guard let unarchiveData = UserDefaults.standard.object(forKey: key) as? Data else {return nil}
        
        return NSKeyedUnarchiver.unarchiveObject(with: unarchiveData) as? [[Task]]
    }
    
    //save
    static func save(_ tasks: [[Task]]){
        
        //Archive
        let archivedTasks = archive(tasks)
        
        //Set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize()
        
    }
    
    
    
    
    
    
    
    
    
    
}
