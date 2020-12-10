//
//  Task.swift
//  toDoList("Tasks")
//
//  Created by Сергей Голенко on 10.12.2020.
//  Copyright © 2020 Sergey Golenko. All rights reserved.
//

import Foundation


class Task {
    var name: String
    var isDone: Bool
    
    init(name:String,isDone:Bool = false) {
        self.name = name
        self.isDone = isDone
    }
}
