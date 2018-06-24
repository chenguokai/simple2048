//
//  2048-Algo.swift
//  Swift-Bomb-2048
//
//  Created by Xim on 2018/6/23.
//  Copyright © 2018年 chenguokai. All rights reserved.
//

import Foundation

public struct Array2D<T> {
    public let columns: Int
    public let rows: Int
    fileprivate var array: [T]
    
    public init(columns: Int, rows: Int, initialValue: T) {
        self.columns = columns
        self.rows = rows
        array = .init(repeating: initialValue, count: rows*columns)
    }
    
    public subscript(column: Int, row: Int) -> T {
        get {
            precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            return array[row*columns + column]
        }
        set {
            precondition(column < columns, "Column \(column) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            precondition(row < rows, "Row \(row) Index is out of range. Array<T>(columns: \(columns), rows:\(rows))")
            array[row*columns + column] = newValue
        }
    }
}
func RandomCustom(_ min: Int, _ max: Int) -> Int {
    //  [min, max)  [0, 100)
    //        var x = arc4random() % UInt32(max);
    //        return Int(x)
    // [min, max）
    let y = arc4random() % UInt32(max) + UInt32(min)
    print(Int(y))
    return Int(y)
}
let multiArray = [2,4,8,16,32,64,128,256]
func RandomNumber() -> Int {
    let t = RandomCustom(2, 128)
    for i in 0...6 {
        if t < multiArray[i] {
            continue
        } else {
            return multiArray[6-i];
        }
    }
    return 0;
}

