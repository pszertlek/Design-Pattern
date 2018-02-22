//
//  Spreadsheet.swift
//  Flyweight
//
//  Created by Pszertlek on 2018/2/22.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class Coordinate: Hashable, CustomStringConvertible {
    static func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.col == rhs.col && lhs.row == lhs.row
    }
    
    let col: Character
    let row: Int
    init(col: Character, row: Int) {
        self.col = col
        self.row = row
    }
    
    var hashValue: Int {
        return description.hashValue
    }
    
    var description: String {
        return "\(col)\(row)"
    }
}

class Cell {
    var coordinate: Coordinate
    var value: Int
    
    init(col: Character, row: Int, val: Int) {
        self.coordinate = Coordinate(col: col, row: row)
        self.value = val
    }
}

class Spreadsheet {
    var grid = Dictionary<Coordinate, Cell>()
    init() {
        let letters: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var stringIndex = letters.startIndex
        let rows = 50
        
        repeat {
            let colLetter = letters[stringIndex]
            stringIndex = letters.index(after: stringIndex)
            for rowIndex in 1...rows {
                let cell = Cell(col: colLetter, row: rowIndex, val: rowIndex)
                grid[cell.coordinate] = cell
            }
            
        } while (stringIndex != letters.endIndex)
    }
    
    func setValue(coor: Coordinate, value: Int) {
        grid[coor]?.value = value
    }
    
    var total: Int {
        return grid.values.reduce(0, { (total, cell)  in
            return total + cell.value
        })
    }
}

