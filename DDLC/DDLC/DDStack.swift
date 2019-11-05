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
        /**
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
        /**
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
        /**
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
    
    // 682. 棒球比赛
    func calPoints(_ ops: [String]) -> Int {
        /**
         给定一个字符串列表，每个字符串可以是以下四种类型之一：
         1.整数（一轮的得分）：直接表示您在本轮中获得的积分数。
         2. "+"（一轮的得分）：表示本轮获得的得分是前两轮 有效 回合得分的总和。
         3. "D"（一轮的得分）：表示本轮获得的得分是前一轮 有效 回合得分的两倍。
         4. "C"（一个操作，这不是一个回合的分数）：表示您获得的最后一个 有效 回合的分数是无效的，应该被移除。
         每一轮的操作都是永久性的，可能会对前一轮和后一轮产生影响。
         你需要返回你在所有回合中得分的总和
         */
        var res = 0
        var stack: [Int] = []
        for n in ops {
            if n == "+" {
                var tmp = stack
                let v = tmp.popLast()! + tmp.popLast()!
                stack.append(v)
                res += v
            }
            else if n == "D" {
                let v = stack.last! * 2
                stack.append(v)
                res += v
            }
            else if n == "C" {
                res -= stack.popLast()!
            }
            else {
                res += Int(n)!
                stack.append(Int(n)!)
            }
        }
        return res
    }
    
    // 844. 比较含退格的字符串
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        /**
         给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。
         示例 1：
         输入：S = "ab#c", T = "ad#c"
         输出：true
         解释：S 和 T 都会变成 “ac”。
         */
        var sStack: [Character] = []
        var tStack: [Character] = []
        for s in S {
            if s == "#" {
                let _ = sStack.popLast()
            }
            else {
                sStack.append(s)
            }
        }
        for t in T {
            if t == "#" {
                let _ = tStack.popLast()
            }
            else {
                tStack.append(t)
            }
        }
        return sStack == tStack
    }
    
//    func backspaceCompare1(_ S: String, _ T: String) -> Bool {
//        /**
//         给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。
//         */
//        var sStack: [Character] = Array(S)
//        var tStack: [Character] = Array(T)
//        var s_c = sStack.count - 1
//        var t_c = tStack.count - 1
//        while s_c >= 0 || t_c >= 0 {
//            let s = sStack[s_c]
//            let t = tStack[t_c]
//            if s != "#" && t != "#" {
//                if s == t {
//                    s_c -= 1
//                    t_c -= 1
//                }
//            }
//        }
//
//        return sStack == tStack
//    }
    
    // 1021. 删除最外层的括号
    func removeOuterParentheses(_ S: String) -> String {
        /**
         有效括号字符串为空 ("")、"(" + A + ")" 或 A + B，其中 A 和 B 都是有效的括号字符串，+ 代表字符串的连接。例如，""，"()"，"(())()" 和 "(()(()))" 都是有效的括号字符串。
         如果有效字符串 S 非空，且不存在将其拆分为 S = A+B 的方法，我们称其为原语（primitive），其中 A 和 B 都是非空有效括号字符串。
         给出一个非空有效字符串 S，考虑将其进行原语化分解，使得：S = P_1 + P_2 + ... + P_k，其中 P_i 是有效括号字符串原语。
         对 S 进行原语化分解，删除分解中每个原语字符串的最外层括号，返回 S 。
         */
        var stack: [Character] = []
        var num = 0
        var res = ""
        for s in S {
            if s == "(" {
                num += 1
            }
            else {
                num -= 1
            }
            if num == 0 {
                var tmp = ""
                while stack.count > 1 {
                    let v = stack.popLast()!
                    tmp = "\(v)\(tmp)"
                }
                let _ = stack.popLast()
                res = "\(res)\(tmp)"
            }
            else {
                stack.append(s)
            }
        }
        return res
    }
    
    func removeOuterParentheses1(_ S: String) -> String {
        /**
         */
        var num = 0
        var res = ""
        for s in S {
            if s == "(" {
                if num > 0 {
                    res.append(s)
                }
                num += 1
            }
            else {
                num -= 1
                if num > 0 {
                    res.append(s)
                }
            }
        }
        return res
    }
}
