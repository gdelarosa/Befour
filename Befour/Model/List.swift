//
//  List.swift
//  Befour
//
//  Created by Gina De La Rosa on 1/6/19.
//  Copyright © 2019 Gina De La Rosa. All rights reserved.
//

import Foundation
import CoreData

class List {
    
    enum timeOfDay: Int, CaseIterable {
        case morning, afternoon, evening, night
    }
    
    private var morningList: [Item] = []
    private var afternoonList: [Item] = []
    private var eveningList: [Item] = []
    private var nightList: [Item] = []
    
    init() {

        let row0Item = Item()
        let row1Item = Item()
        let row2Item = Item()
        let row3Item = Item()

        row0Item.text = "Explore App"
        row1Item.text = "Create my own to do"
        row2Item.text = "Complete a to do"
        row3Item.text = "Feel accomplished!"

        addTodo(row0Item, for: .morning)
        addTodo(row1Item, for: .afternoon)
        addTodo(row2Item, for: .evening)
        addTodo(row3Item, for: .night)
        
    }
    
    func addTodo(_ item: Item, for priority: timeOfDay, at index: Int = -1) {
        switch priority {
        case .morning:
            if index < 0 {
                morningList.append(item)
            } else {
                morningList.insert(item, at: index)
            }
        case .afternoon:
            if index < 0 {
                afternoonList.append(item)
            } else {
                afternoonList.insert(item, at: index)
            }
        case .evening:
            if index < 0 {
                eveningList.append(item)
            } else {
                eveningList.insert(item, at: index)
            }
        case .night:
            if index < 0 {
                nightList.append(item)
            } else {
                nightList.insert(item, at: index)
            }
        }
    }
    
    func todoList(for priority: timeOfDay) -> [Item] {
        switch priority {
        case .morning:
            return morningList
        case .afternoon:
            return afternoonList
        case .evening:
            return eveningList
        case .night:
            return nightList
        }
    }
    
    func newTodo() -> Item {
        let item = Item()
        //item.text = randomTitle()
        item.checked  = true
        morningList.append(item)
        return item
    }
    
    func move(item: Item, from sourcePriority: timeOfDay, at sourceIndex: Int, to destinationPriority: timeOfDay, at destinationIndex: Int) {
        remove(item, from: sourcePriority, at: sourceIndex)
        addTodo(item, for: destinationPriority, at: destinationIndex)
        
    }
    
    func remove(_ item: Item, from priority: timeOfDay, at index: Int) {
        switch priority {
        case .morning:
            morningList.remove(at: index)
        case .afternoon:
            afternoonList.remove(at: index)
        case .evening:
            eveningList.remove(at: index)
        case .night:
            nightList.remove(at: index)
        }
    }
}
