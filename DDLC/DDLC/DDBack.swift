//
//  DDDynamicBack.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/25.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDBack: NSObject {
    // 401. 二进制手表
    func readBinaryWatch(_ num: Int) -> [String] {
        var res: [String] = []
        var path: [Int] = []
        func binaryHdfs(_ count: Int, _ index: Int, _ num: Int) {
            if count == index {
                if num == 0 {
                    var a = 0
                    var b = 0
                    for i in 0..<count {
                        if i < 4 {
                            a = Int(pow(2, Float(3-i))) * path[i] + a
                        } else {
                            b = Int(pow(2, Float(9-i))) * path[i] + b
                        }
                    }
                    if a < 12 && b < 60 {
                        if b < 10 {
                            res.append("\(a):0\(b)")
                        } else {
                            res.append("\(a):\(b)")
                        }
                    }
                }
                return
            }
            path.append(0)
            binaryHdfs(count, index+1, num)
            path.removeLast()
            if num > 0 {
                path.append(1)
                binaryHdfs(count, index+1, num-1)
                path.removeLast()
            }
        }
        binaryHdfs(10, 0, num)
        return res
    }
    
    // 784. 字母大小写全排列
    func letterCasePermutation(_ S: String) -> [String] {
        /**
         给定一个字符串S，通过将字符串S中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。
         示例:
         输入: S = "a1b2"
         输出: ["a1b2", "a1B2", "A1b2", "A1B2"]
         输入: S = "3z4"
         输出: ["3z4", "3Z4"]
         输入: S = "12345"
         输出: ["12345"]
         */
        var res: [String] = []
        var path: String = ""
        var chars = Array(S)
        func _dfs(_ size: Int, _ index: Int) {
            if index == size {
                return res.append(path)
            }
            let char = chars[index]
            path.append(String(char))
            _dfs(size, index+1)
            path.removeLast()
            if char.isLetter {
                path.append(char.isLowercase ? char.uppercased() : char.lowercased())
                _dfs(size, index+1)
                path.removeLast()
            }
        }
        _dfs(chars.count, 0)
        return res
    }
}

extension DDBack {
    // 17. 电话号码的字母组合
    func letterCombinations(_ digits: String) -> [String] {
        /**
         给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
         给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
         输入："23"
         输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
         */
        var itemDic = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        var res: [String] = []
        var path: String = ""
        var items = Array(digits)
        func letterHdfs(_ count: Int, _ index: Int) {
            if index == count {
                res.append(path)
                return
            }
            if let itemArr = itemDic[String(items[index])] {
                for item in itemArr {
                    path.append(item)
                    letterHdfs(count, index+1)
                    path.removeLast()
                }
            }
        }
        if items.count > 0 {
            letterHdfs(items.count, 0)
        }
        return res
    }
    
}
