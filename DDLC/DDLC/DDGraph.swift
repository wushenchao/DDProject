//
//  DDFigure.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/28.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDGraph: NSObject {

    var adj: [[Int]] = []
    var v: Int = 0
    
    func `init`(_ v: Int) {
        self.v = v
        adj = Array(repeating: [], count: v)
    }
    
    func addEdge(_ s: Int, _ t: Int) {
        adj[s].append(t)
        adj[t].append(s)
    }
    
    func bfs(_ s: Int, _ t: Int) {
        if s == t {
            return
        }
        var visited: [Bool] = Array(repeating: false, count: v)
        visited[s] = true
        var queue: [Int] = []
        queue.append(s)
        var prev: [Int] = Array(repeating: -1, count: v)
        while queue.count > 0 {
            let w = queue.first
        }
    }
    
    func dfs(_ s: Int, _ t: Int) {
        
    }
    
    /**
     s:
     */
    func bm(_ b: Int, _ bc: Int) {
        
        let val = [1, 2, 3]
        for (index, v) in val.enumerated() {
            print(index)
            print(v)
        }
    }
    
}

struct BlackjackCard {

    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }

}
