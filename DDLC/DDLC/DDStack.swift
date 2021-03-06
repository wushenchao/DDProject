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
    
    // 1047. 删除字符串中的所有相邻重复项
    func removeDuplicates(_ S: String) -> String {
        /**
         给出由小写字母组成的字符串 S，重复项删除操作会选择两个相邻且相同的字母，并删除它们。
         在 S 上反复执行重复项删除操作，直到无法继续删除。
         在完成所有重复项删除操作后返回最终的字符串。答案保证唯一。
         示例：
         输入："abbaca" 输出："ca"
         解释：
         例如，在 "abbaca" 中，我们可以删除 "bb" 由于两字母相邻且相同，这是此时唯一可以执行删除操作的重复项。之后我们得到字符串 "aaca"，其中又只有 "aa" 可以执行重复项删除操作，所以最后的字符串为 "ca"。
         */
        var stack: [Character] = []
        for s in S {
            if stack.last == s {
                let _ = stack.popLast()
            }
            else {
                stack.append(s)
            }
        }
        return String(stack)
    }
}

// mid
extension DDStack {
    // 71. 简化路径
    func simplifyPath(_ path: String) -> String {
        /**
         以 Unix 风格给出一个文件的绝对路径，你需要简化它。或者换句话说，将其转换为规范路径。
         在 Unix 风格的文件系统中，一个点（.）表示当前目录本身；此外，两个点 （..） 表示将目录切换到上一级（指向父目录）；
         两者都可以是复杂相对路径的组成部分。更多信息请参阅：Linux / Unix中的绝对路径 vs 相对路径
         请注意，返回的规范路径必须始终以斜杠 / 开头，并且两个目录名之间必须只有一个斜杠 /。最后一个目录名（如果存在）不能以 / 结尾。此外，规范路径必须是表示绝对路径的最短字符串。
         示例 1： 输入："/home/" 输出："/home"
         解释：注意，最后一个目录名后面没有斜杠。
         */
        /**
         注意: ... 三个点是目录
         */
        let stacks = path.split(separator: "/")
        var stack: [String] = []
        for s in stacks {
            if s == ".." {
                let _ = stack.popLast()
            }
            else if s != "" && s != "." {
                stack.append(String(s))
            }
        }
        var res = ""
        for s in stack {
            res = res + "/" + s
        }
        return res.count > 0 ? res : "/"
    }
    
    // 94. 二叉树的中序遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        /**
         栈的方法
         */
        var head = root
        var stack: [TreeNode] = []
        var res: [Int] = []
        while head != nil || stack.count > 0 {
            while head != nil {
                stack.append(head!)
                head = head?.left
            }
            head = stack.popLast()
            res.append(head!.val)
            head = head?.right
        }
        return res
    }
    
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        /**
         循环遍历
         */
        var res: [Int] = []
        func helper(_ root: TreeNode?,_ res: inout [Int]) {
            if root != nil {
                if root?.left != nil {
                    helper(root?.left, &res)
                }
                res.append(root!.val)
                if root?.right != nil {
                    helper(root?.right, &res)
                }
            }
        }
        helper(root, &res)
        return res
    }
    
    // 103. 二叉树的锯齿形层次遍历
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        /**
         给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
         */
        var res: [[Int]] = []
        var stack: [TreeNode] = []
        if root != nil {
            stack.append(root!)
        }
        var left = false
        while stack.count > 0 {
            var tmpStack: [TreeNode] = []
            var tmpRes: [Int] = []
            while stack.count > 0 {
                let tree = stack.popLast()
                tmpRes.append(tree!.val)
                if left == true {// right first
                    if let rTree = tree?.right {
                        tmpStack.append(rTree)
                    }
                    if let lTree = tree?.left {
                        tmpStack.append(lTree)
                    }
                }
                else { // left first
                    if let lTree = tree?.left {
                        tmpStack.append(lTree)
                    }
                    if let rTree = tree?.right {
                        tmpStack.append(rTree)
                    }
                }
            }
            res.append(tmpRes)
            stack = tmpStack
            left = !left
        }
        return res
    }
    
    // 144. 二叉树的前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        /**
         给定一个二叉树，返回它的 前序 遍历.
         */
        var res: [Int] = []
        func helper(_ root: TreeNode?,_ res: inout [Int]) {
            if root != nil {
                res.append(root!.val)
                if root?.left != nil {
                    helper(root?.left, &res)
                }
                if root?.right != nil {
                    helper(root?.right, &res)
                }
            }
        }
        helper(root, &res)
        return res
    }
    
    // 150. 逆波兰表达式求值
    func evalRPN(_ tokens: [String]) -> Int {
        /**
         根据逆波兰表示法，求表达式的值。
         有效的运算符包括 +, -, *, / 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
         说明：
         整数除法只保留整数部分。
         给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。
         示例 1：
         输入: ["2", "1", "+", "3", "*"]
         输出: 9
         解释: ((2 + 1) * 3) = 9
         */
        var stack: [Int] = []
        for token in tokens {
            if token == "+" {
                let res = stack.popLast()! + stack.popLast()!
                stack.append(res)
            }
            else if token == "-" {
                let a = stack.popLast()!
                let res = stack.popLast()! - a
                stack.append(res)
            }
            else if token == "*" {
                let res = stack.popLast()! * stack.popLast()!
                stack.append(res)
            }
            else if token == "/" {
                let a = stack.popLast()!
                let res = stack.popLast()! / a
                stack.append(res)
            }
            else {
                stack.append(Int(token)!)
            }
        }
        return stack.popLast()!
    }
    
    // 331. 验证二叉树的前序序列化
    func isValidSerialization(_ preorder: String) -> Bool {
        /**
         序列化二叉树的一种方法是使用前序遍历。当我们遇到一个非空节点时，我们可以记录下这个节点的值。如果它是一个空节点，我们可以使用一个标记值记录，例如 #。
         例如，上面的二叉树可以被序列化为字符串 "9,3,4,#,#,1,#,#,2,#,6,#,#"，其中 # 代表一个空节点。
         给定一串以逗号分隔的序列，验证它是否是正确的二叉树的前序序列化。编写一个在不重构树的条件下的可行算法。
         每个以逗号分隔的字符或为一个整数或为一个表示 null 指针的 '#' 。
         你可以认为输入格式总是有效的，例如它永远不会包含两个连续的逗号，比如 "1,,3" 。
         */
        if preorder == "#" { return true }
        let preorders = preorder.split(separator: ",")
        var stack: [String] = []
        var count = 0
        var pre_count = preorders.count
        for pre in preorders {
            pre_count -= 1
            stack.append(String(pre))
            if pre == "#" {
                count += 1
            } else {
                count = 0
            }
            while count == 2 {
                if stack.count == 2 {
                    return false
                } else if stack.count == 3 {
                    return pre_count == 0
                } else {
                    for _ in 0..<3 {
                        let _ = stack.popLast()
                    }
                    count = stack.last! == "#" ? 2 : 1
                    stack.append("#")
                }
            }
        }
        return stack.count == 0
    }
    
    // 394. 字符串解码
    func decodeString(_ s: String) -> String {
        /**
         给定一个经过编码的字符串，返回它解码后的字符串。
         编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。
         你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。
         此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。
         示例:
         s = "3[a]2[bc]", 返回 "aaabcbc".
         s = "3[a2[c]]", 返回 "accaccacc".
         s = "2[abc]3[cd]ef", 返回 "abcabccdcdcdef".
         */
        var stacks: [String] = []
        var res = ""
        for str in s {
            if str == "]" {
                // get repet string
                var repeat_str: String = ""
                while stacks.count > 0 && stacks.last! != "[" {
                    repeat_str = "\(stacks.popLast()!)\(repeat_str)"
                }
                // pop [
                let _ = stacks.popLast()
                // get repet count
                var repet_count = 0
                var flag = true
                var multiple = 1
                while flag && stacks.count > 0 {
                    let v = stacks.popLast()!
                    flag = Character(v).isWholeNumber
                    if flag {
                        repet_count = repet_count + Int(v)! * multiple
                        multiple *= 10
                    }
                    else {
                        stacks.append(v)
                    }
                }
                let repeat_res: String = repet_count * repeat_str
                if stacks.count > 0 {
                    stacks.append(repeat_res)
                }
                else {
                    res = res + repeat_res
                }
            }
            else {
                stacks.append(String(str))
            }
        }
        return res + stacks.joined()
    }
    
    func decodeString1(_ s: String) -> String {
        var stacks: [(Int, String)] = []
        var res = ""
        var multi = 0
        for c in s {
            if let n = c.wholeNumberValue {
                multi = multi * 10 + n
            }
            else if c == "[" {
                stacks.append((multi, res))
                res = ""
                multi = 0
            }
            else if c == "]" {
                let v = stacks.popLast()!
                res = v.1 + v.0 * res
            }
            else {
                res.append(c)
            }
        }
        return res
    }
    
    // 402. 移掉K位数字
    func removeKdigits(_ num: String, _ k: Int) -> String {
        /**
         给定一个以字符串表示的非负整数 num，移除这个数中的 k 位数字，使得剩下的数字最小。
         注意: num 的长度小于 10002 且 ≥ k。num 不会包含任何前导零。
         示例 1 :
             输入: num = "1432219", k = 3 输出: "1219"
             解释: 移除掉三个数字 4, 3, 和 2 形成一个新的最小的数字 1219。
         10200
         */
        var stacks: [Character] = []
        var kk = k
        for c in num {
            let v: Int = Int(String(c))!
            // 剩余移除数 > 0 当前数 < 缓存中的d最后一个数
            while kk > 0 && stacks.count > 0 && v < Int(String(stacks.last!))! {
                let _ = stacks.popLast()
                kk -= 1
            }
            // 前导向为 0 不计入
            if stacks.count == 0 && v == 0 {
                continue
            }
            stacks.append(c)
        }
        while kk > 0 {
            let _ = stacks.popLast()
            kk -= 1
        }
        return stacks.count > 0 ? String(stacks) : "0"
    }
}

extension String {
    static func * (lhs: Int, rhs: String) -> String {
        return (0..<lhs).reduce("") { (res, index) -> String in res + rhs }
    }
}
