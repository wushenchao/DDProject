//
//  DDStack.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/4.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDStack: NSObject {
    // 20. 有效等括号
    func isValid(_ s: String) -> Bool {
        /*
         给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
         有效字符串需满足：左括号必须用相同类型的右括号闭合。左括号必须以正确的顺序闭合。注意空字符串可被认为是有效字符串。
         */
        let dic: [Character: Character] = ["}": "{",  "]": "[", ")": "("]
        var arr: [Character] = []
        for c in s {
            let v = dic[c]
            if v == nil {
                arr.append(c)
            }
            else if arr.popLast() != v {
                return false
            }
        }
        return arr.count == 0
    }
    
    // 155. 最小栈
    class MinStack {
        /**
         设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
         push(x) -- 将元素 x 推入栈中。
         pop() -- 删除栈顶的元素。
         top() -- 获取栈顶元素。
         getMin() -- 检索栈中的最小元素。
         */
        /** initialize your data structure here. */
        private var arr: [Int]
        private var tmp: [Int]
        
        init() {
            self.arr = []
            self.tmp = []
        }
        
        func push(_ x: Int) {
            self.arr.append(x)
            let c = self.tmp.count
            if c == 0 || self.tmp[c-1] > x {
                self.tmp.append(x)
            }
        }
        
        func pop() {
            let top = self.arr.popLast()
            let c = self.tmp.count
            if c > 0 && top == self.tmp[c-1] {
               let _ = self.tmp.popLast()
            }
        }
        
        func top() -> Int {
            let c = self.arr.count
            if c > 0 {
                return self.arr[c-1]
            }
            return 0
        }
        
        func getMin() -> Int {
            let c = self.tmp.count
            if c > 0 {
                return self.tmp[c-1]
            }
            return 0
        }
    }
    
    // 496. 下一个更大元素 I
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /*
         给定两个没有重复元素的数组 nums1 和 nums2 ，其中nums1 是 nums2 的子集。找到 nums1 中每个元素在 nums2 中的下一个比其大的值。
         nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，对应位置输出-1。
         */
        var dic: [Int: Int] = [:]
        var res: [Int] = []
        for num in nums2 {
            if nums1.contains(num) {
                dic[num] = -1
            }
            for k in dic.keys {
                if dic[k]! == -1 && k < num {
                    dic[k] = num
                }
            }
        }
        for num in nums1 {
            let v = dic[num]
            if v == nil {
                res.append(-1)
            }
            else {
                res.append(v!)
            }
        }
        return res
    }
    
    func nextGreaterElement1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /*
         给定两个没有重复元素的数组 nums1 和 nums2 ，其中nums1 是 nums2 的子集。找到 nums1 中每个元素在 nums2 中的下一个比其大的值。
         nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，对应位置输出-1。
         */
        var stack: [Int] = []
        var dict: [Int:Int] = [:]
        for num in nums2 {
            while !stack.isEmpty && stack.last! < num {
                dict[stack.popLast()!] = num
            }
            stack.append(num)
        }
        return nums1.map{dict[$0] ?? -1}
    }
}
