//
//  ViewController.swift
//  DDLC
//
//  Created by ... on 2019/3/2.
//  Copyright © 2019 .... All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]))
//        print(plusOne([1,0,0,0,1]))
//        var nums1 = [1, 2, 3, 0, 0]
//        merge(&nums1, 3, [3, 4], 2)
//        print(nums1)
        let res = isPalindrome("A man, a plan, a canal: Panama")
        print(res)
    }
}


// MARK: - ListNode
extension ViewController {

    /// Definition for singly-linked list.
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    // 83. 删除排序链表中的重复元素
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        /*
         给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
         */
        var current = head
        while (current != nil) && ((current?.next) != nil) {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            }
            else {
                current = current?.next
            }
        }
        return head
    }
    
    // 88. 合并两个有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        /*
         给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
         说明:
         初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
         你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
         输入:
         nums1 = [1,2,3,0,0,0], m = 3
         nums2 = [2,5,6],       n = 3
         
         输出: [1,2,2,3,5,6]
         */
        var m_index = m - 1
        var n_index = n - 1
        var c_index = m + n - 1
        while (m_index >= 0) && (n_index >= 0) {
            if nums1[m_index] > nums2[n_index] {
                nums1[c_index] = nums1[m_index]
                m_index -= 1
            }
            else {
                nums1[c_index] = nums2[n_index]
                n_index -= 1
            }
            c_index -= 1
        }
        while (n_index >= 0) {
            nums1[c_index] = nums2[n_index]
            c_index -= 1
            n_index -= 1
        }
    }
    
    // 141. 环形链表
    func hasCycle(_ root: ListNode?, _ index: Int) -> Bool {
        /*
         给定一个链表，判断链表中是否有环。
         为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
         */
        if root == nil || root?.next == nil {
            return false
        }
        var slow: ListNode? = root
        var fast: ListNode? = root?.next
        while slow?.val != fast?.val {
            if fast == nil || fast?.next == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
    
    // 155. 最小栈
    class MinStack {
        /*
         设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
         push(x) -- 将元素 x 推入栈中。
         pop() -- 删除栈顶的元素。
         top() -- 获取栈顶元素。
         getMin() -- 检索栈中的最小元素。
         */
        /** initialize your data structure here. */
        var minList: ListNode?
        var list: ListNode?
        var lastNode: ListNode?
        init() {
        }
        
        func push(_ x: Int) {
            guard (minList != nil) && (list != nil) else {
                minList = ListNode(x)
                list = ListNode(x)
                lastNode = list
                return
            }
            let newNode = ListNode(x)
            lastNode?.next = newNode
            lastNode = newNode
            
            // 获取该节点插入的位置
            var minNode = minList
            while minNode!.val < x {
                if minNode?.next != nil {
                    minNode = minNode?.next
                }
            }
            let minNewNode = ListNode(x)
            if minNode?.next == nil {
                minNode?.next = minNewNode
            }
            else {
                let tmp = minNode?.next
                minNewNode.next = tmp
                minNode?.next = minNewNode
            }
        }
        
        func pop() {
            guard list != nil else {
                return
            }
            // 只剩最后一个
            guard list?.next != nil else {
                list = nil
                lastNode = nil
                minList = nil
                return
            }
            var tmp = list
            while tmp != nil {
                if tmp?.next?.next != nil {
                    tmp = tmp?.next
                }
                else {
                    break
                }
            }
            tmp?.next = nil
            // 更新最小链表
            var tmpMinList = minList
            while tmpMinList?.val != tmp?.val {
                if tmpMinList?.next?.val != tmp?.val {
                    tmpMinList = tmpMinList?.next
                }
                else {
                    let nextTmp = tmpMinList?.next
                    tmpMinList?.next = nextTmp?.next
                }
            }
        }
        
        func top() -> Int {
            if lastNode != nil {
                return lastNode!.val
            }
            return 0
        }
        
        func getMin() -> Int {
            if minList != nil {
                return minList!.val
            }
            return 0
        }
    }
    
    // 160. 相交链表
    func crossLinked(_ headOne: ListNode?, _ headTwo: ListNode?) -> Bool {
        /*
         编写一个程序，找到两个单链表相交的起始节点。
         如果两个链表没有交点，返回 null.
         在返回结果后，两个链表仍须保持原有的结构。
         可假定整个链表结构中没有循环。
         程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存。
         */
        
        return false
    }
}



// MARK: - binary tree node
extension ViewController {

    /// Definition for a binary tree node.
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    // 100. 相同的树
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil  {
            return true
        }
        if p != nil && q != nil && p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false;
    }
    
    // 101. 对称的二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        /*
         给定一个二叉树，检查它是否是镜像对称的。例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
         */
        if root == nil {
            return true
        }
        func isSymmeTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil  {
                return true
            }
            if left != nil && right != nil && left?.val == right?.val {
                return isSymmeTree(left?.left, right?.right) && isSymmeTree(left?.right, right?.left)
            }
            return false
        }
        return isSymmeTree(root?.left, root?.right)
    }
    
    // 104. 二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        /*
         给定一个二叉树，找出其最大深度。二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
         说明: 叶子节点是指没有子节点的节点。
         */
        /*
        if root == nil {
            return 0
        }
        func depth(_ left: TreeNode?, _ right: TreeNode?, _ dep: Int) -> Int {
            if left != nil || right != nil {
                let dep = dep + 1
                return max(depth(left?.left, left?.right, dep), depth(right?.left, right?.right, dep))
            }
            return dep
        }
        return depth(root?.left, root?.right, 1)
        */
        return root == nil ? 0 : max(maxDepth(root?.left) + 1, maxDepth(root?.right) + 1)
    }
    
    // 107. 二叉树的层次遍历 II
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        /*
         给定一个二叉树，返回其节点值自底向上的层次遍历。（即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
         */
        if root == nil {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(root!)
        while !queue.isEmpty {
            var count = queue.count
            var tmp: [Int] = []
            while count != 0 {
                let node = queue.removeFirst()
                tmp.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                count -= 1
            }
            result.append(tmp)
        }
        return result.reversed()
    }
    
    // 108. 将有序数组转换为二叉搜索树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        /*
         将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
         本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1
         */
        return nil
    }
    
    // 110. 平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        /*
         给定一个二叉树，判断它是否是高度平衡的二叉树。
         本题中，一棵高度平衡二叉树定义为：一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
         */
        if root == nil {
            return true
        }
        /*
        let leftDepth: Int = maxDepth(root?.left)
        let rightDepth: Int = maxDepth(root?.right)
        let diff: Int = leftDepth - rightDepth
        if diff > 1 || diff < -1 {
            return false
        }
        return isBalanced(root?.left) && isBalanced(root?.right)
        */
        var depth: Int = 0
        return isBalanceTreeOnce(root, &depth)
    }
    
    func isBalanceTreeOnce(_ root: TreeNode?, _ depth: inout Int) -> Bool {
        if root == nil {
            depth = 0
            return true
        }
        var leftDepth: Int = 0
        var rightDepth: Int = 0
        if isBalanceTreeOnce(root?.left, &leftDepth) && isBalanceTreeOnce(root?.right, &rightDepth) {
            let diff: Int = leftDepth - rightDepth
            if diff <= 1 && diff >= -1 {
                depth = leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
                return true
            }
        }
        return false
    }
    
    
    // 111. 二叉树的最小深度
    func minDepth(_ root: TreeNode?) -> Int {
        /*
         给定一个二叉树，找出其最小深度。
         最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
         说明: 叶子节点是指没有子节点的节点。
         */
        if root == nil {
            return 0
        }
        let minLeft = minDepth(root?.left)
        let minRight = minDepth(root?.right)
        if ((root?.left) != nil) && ((root?.right) != nil) {
            return min(minLeft, minRight) + 1
        }
        return 1 + minLeft + minRight
    }

    // 112. 路径总和
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        /*
         给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
         说明: 叶子节点是指没有子节点的节点。
         示例: 给定如下二叉树，以及目标和 sum = 22，
         */
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil && sum == root?.val {
            return true
        }
        return hasPathSum(root?.left, sum - root!.val) || hasPathSum(root?.right, sum-root!.val)
    }
    
}

extension ViewController {
    
    // 1. 两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        /*
         给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
         你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
         */
        let index = nums.count
        for i in 0..<index {
            for j in i+1..<index {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [0]
    }
    
    // 58. 最后一个单词的长度
    func lengthOfLastWord(_ s: String) -> Int {
        /*
         给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
         如果不存在最后一个单词，请返回 0 。
         说明：一个单词是指由字母组成，但不包含任何空格的字符串。
         示例:
         输入: "Hello World"
         输出: 5
         */
        let datas = s.split(separator: " ")
        for d in datas.reversed() {
            if d != "" {
                return d.lengthOfBytes(using: .utf8)
            }
        }
        return 0
    }
    
    // 66. 加一
    func plusOne(_ digits: [Int]) -> [Int] {
        /*
         给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
         最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
         你可以假设除了整数 0 之外，这个整数不会以零开头。
         示例 1:
         输入: [1,2,3]
         输出: [1,2,4]
         解释: 输入数组表示数字 123。
         */
        var result = digits
        var i = digits.count
        for item in digits.reversed() {
            i -= 1
            if item + 1 < 10 {
                result[i] = item + 1
                break
            }
            else {
                result[i] = 0
                if i == 0 {
                    result.insert(1, at: 0)
                }
            }
        }
        return result
    }
    
    // 69. x的平方根
    func mySqrt(_ x: Int) -> Int {
        /*
         实现 int sqrt(int x) 函数。
         计算并返回 x 的平方根，其中 x 是非负整数。
         由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
         示例 1:
         输入: 4
         输出: 2
         */
        var r = x
        while r * r > x {
            r = (r + (x / r)) / 2
        }
        return Int(r)
    }
    
    // 70. 爬楼梯
    /*
     func climbStairs(_ n: Int) -> Int {
     //此方法会产生越界
     if n <= 2 {
     return n
     }
     return climbStairs(n-1) + climbStairs(n-2)
     }
     */
    func climbStairs1(_ n: Int) -> Int {
        /*
         假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
         每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
         注意：给定 n 是一个正整数。
         示例 1
         输入： 2
         输出： 2
         解释： 有两种方法可以爬到楼顶。
         1.  1 阶 + 1 阶
         2.  2 阶
         */
        if n == 1 || n <= 0 {
            return 1
        } else if n == 2 {
            return 2
        } else {
            var f1 = 1
            var f2 = 2
            var f3 = 0
            for _ in 2..<n {
                f3 = f1 + f2
                f1 = f2
                f2 = f3
            }
            return f3
        }
    }
    
    // 118. 杨辉三角
    func generate(_ numRows: Int) -> [[Int]] {
        /*
         给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
         */
        if numRows == 0 {
            return []
        }
        if numRows == 1 {
            return [[1]]
        }
        var results: [[Int]] = [[1], [1, 1]]
        var lastRow: [Int] = [1, 1]
        var rows = 2
        while rows < numRows {
            rows += 1
            var current = [1]
            for i in 1..<lastRow.count {
                current.append(lastRow[i-1] + lastRow[i])
            }
            current.append(1)
            lastRow = current
            results.append(current)
        }
        return results
    }
    
    // 119. 杨辉三角 II
    func getRow(_ rowIndex: Int) -> [Int] {
        /*
         给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
         */
        if rowIndex == 0 {
            return [1]
        }
        if rowIndex == 1 {
            return [1, 1]
        }
        var result: [Int] = [1, 1]
        var rows = 1
        while rows < rowIndex {
            rows += 1
            var current = [1]
            for i in 1..<result.count {
                current.append(result[i-1] + result[i])
            }
            current.append(1)
            result = current
        }
        return result
    }
    
    // 125. 验证回文串
    func isPalindrome(_ s: String) -> Bool {
        /*
         给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
         说明：本题中，我们将空字符串定义为有效的回文串。
         */
        if s.count < 2 {
            return true
        }
        let lowers = s.lowercased()
        var ints: [UInt32] = []
        for v in lowers.unicodeScalars {
            let character = v.value
            if (character >= 97 && character <= 122) ||
                (character >= 48 && character <= 57) {
                ints.append(v.value)
            }
        }
        var i = 0
        var j = ints.count - 1
        while i < j {
            if ints[i] != ints[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
    
    // 136. 只出现一次的数字
    func singleNumber(_ nums: [Int]) -> Int {
        /*
         给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
         说明：你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
         */
        var result = 0
        for num in nums {
            result = result ^ num
        }
        return result
    }
    
    // 167. 两数之和 II - 输入有序数组
    func twoSumTwo(_ numbers: [Int], _ target: Int) -> [Int] {
        /*
         给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
         函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
         说明:
         返回的下标值（index1 和 index2）不是从零开始的。
         你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
         */
        var left = 0
        var right = numbers.count - 1
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum == target {
                return [left + 1, right + 1]
            }
            else if sum < target {
                left += 1
            }
            else {
                right -= 1
            }
        }
        return [0]
    }
    
    // 168. Excel表列名称
    func convertToTitle(_ n: Int) -> String {
        /*
         给定一个正整数，返回它在 Excel 表中相对应的列名称。
         例如，
         1 -> A
         2 -> B
         3 -> C
         ...
         26 -> Z
         27 -> AA
         28 -> AB
         ...
         */
        var result: String = ""
        var num = n
        while num > 0 {
            var c_num = num % 26
            if c_num == 0 {
                c_num = 26
                num -= 26
            }
            let ch: Character = Character(UnicodeScalar(c_num + 64)!)
            result = "\(ch)" + result
            num = num / 26
        }
        return result
    }
    
    // 171. Excel表列序号
    func titleToNumber(_ s: String) -> Int {
        /*
         给定一个Excel表格中的列名称，返回其相应的列序号。
         例如，
         A -> 1
         B -> 2
         C -> 3
         ...
         Z -> 26
         AA -> 27
         AB -> 28
         ...
         */
        var sum = 0
        var base = 1
        for v in s.unicodeScalars.reversed() {
            let character: Int = Int(v.value) - 64
            sum += character * base
            base *= 26
        }
        return sum
    }
    
    // 169. 求众数 摩尔排序
    func majorityElement(_ nums: [Int]) -> Int {
        /*
         给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
         你可以假设数组是非空的，并且给定的数组总是存在众数。
         示例 1:
         输入: [3,2,3]
         输出: 3
         */
        let nums_count = nums.count
        if nums_count == 1 {
            return nums[0]
        }
        var tmp_num = 0
        var count = 0
        for i in 0..<nums_count {
            if count == 0 {
                tmp_num = nums[i]
            }
            if nums[i] == tmp_num {
                count += 1
            }
            else {
                count -= 1
            }
        }
        return tmp_num
    }
    
    // 229. 求众数 II
    func majorityElement2(_ nums: [Int]) -> [Int] {
        /*
         给定一个大小为 n 的数组，找出其中所有出现超过 ⌊ n/3 ⌋ 次的元素。
         说明: 要求算法的时间复杂度为 O(n)，空间复杂度为 O(1)。
         */
        let nums_count = nums.count
        var tmp_num1 = 0
        var count1 = 0
        var tmp_num2 = 0
        var count2 = 0
        for i in 0..<nums_count {
            let value = nums[i]
            /*注意此处判断顺序*/
            if tmp_num1 == value {
                count1 += 1
            }
            else if tmp_num2 == value {
                count2 += 1
            }
            else if count1 == 0 {
                tmp_num1 = value
                count1 += 1
            }
            else if count2 == 0 {
                tmp_num2 = value
                count2 += 1
            }
            else {
                count1 -= 1
                count2 -= 1
            }
        }
        
        // 重新计算数量
        count1 = 0
        count2 = 0
        for v in nums {
            if v == tmp_num1 {
                count1 += 1
            }
            else if v == tmp_num2 {
                count2 += 1
            }
        }
        var res: [Int] = []
        if count1 > nums_count / 3 {
            res.append(tmp_num1)
        }
        if count2 > nums_count / 3 {
            res.append(tmp_num2)
        }
        return res
    }
    
    // 172. 阶乘后的零
    func trailingZeroes(_ n: Int) -> Int {
        /*
         给定一个整数 n，返回 n! 结果尾数中零的数量。
         示例 1:输入: 3 输出: 0 解释: 3! = 6, 尾数中没有零。
         算法的时间复杂度应为 O(log n) 。
         */
        var num = n
        var count = 0
        while num > 0 {
            num = Int(num/5)
            count += num
        }
        return count
    }
    
    // 233. 数字1的个数
    func countDigitOne(_ n: Int) -> Int {
        /*
         给定一个整数 n，计算所有小于等于 n 的非负整数中数字 1 出现的个数
         */
        var num = n
        var count = 0
        while num > 0 {
            num /= Int(n/10)
            count += 0
        }
        return 0
    }
    
    // 189. 旋转数组
    func rotate(_ nums: inout [Int], _ k: Int) {
        /*
         给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
         示例 1:
         输入: [1,2,3,4,5,6,7] 和 k = 3
         输出: [5,6,7,1,2,3,4]
         解释:
         向右旋转 1 步: [7,1,2,3,4,5,6]
         向右旋转 2 步: [6,7,1,2,3,4,5]
         向右旋转 3 步: [5,6,7,1,2,3,4]
         */
        let count = nums.count
        if count < 2 || k % count == 0 {
            return
        }
        let s = k % count
        for _ in 0..<s {
            let num: Int = nums.popLast()!
            nums.insert(num, at: 0)
        }
    }
    
    // 198. 打家劫舍
    func rob(_ nums: [Int]) -> Int {
        /*
         你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装
         有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
         给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
         示例 1:
         输入: [1,2,3,1]
         输出: 4
         解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
         偷窃到的最高金额 = 1 + 3 = 4
         */
        var last = 0
        var now = 0
        for v in nums {
            let tmp = max(last + v, now)
            last = now
            now = tmp
        }
        return now
    }
    
    // 202. 快乐数
    func isHappy(_ n: Int) -> Bool {
        /*
         编写一个算法来判断一个数是不是“快乐数”。
         一个“快乐数”定义为：对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和，然后重复这个
         过程直到这个数变为 1，也可能是无限循环但始终变不到 1。如果可以变为 1，那么这个数就是快乐数。
         示例:
         输入: 19 输出: true
         解释:
         1*1 + 9*9 = 82
         8*8 + 2*2 = 68
         6*6 + 8*8 = 100
         1*1 + 0*0 + 0*0 = 1
         */

        /*
        // 该方法有问题
        var num = n
        var tmp:[Int] = [n]
        while true {
            var res = 0
            while num > 0 {
                res += (num % 10) * (num % 10)
                num = num / 10
            }
            if res == 1 {
                return true
            }
            else if tmp.contains(res) {
                return false
            }
            else {
                tmp.append(res)
                num = res
            }
        }
        */
        var i = n
        var nums : [Int] = []
        while true {
            while i > 0 {
                let tmp = i % 10
                nums.append(tmp)
                i /= 10
            }
            i = nums.map({$0 * $0}).reduce(0, +)
            if i == 1 {
                return true
            } else if i == 4 {
                return false
            } else {
                nums.removeAll()
            }
        }
    }
}



// MARK: - mySql
extension ViewController {
    // 175. 组合两个表
    /*
     表1: Person
     +-------------+---------+
     | 列名         | 类型     |
     +-------------+---------+
     | PersonId    | int     |
     | FirstName   | varchar |
     | LastName    | varchar |
     +-------------+---------+
     PersonId 是上表主键
     表2: Address
     +-------------+---------+
     | 列名         | 类型    |
     +-------------+---------+
     | AddressId   | int     |
     | PersonId    | int     |
     | City        | varchar |
     | State       | varchar |
     +-------------+---------+
     AddressId 是上表主键
     编写一个 SQL 查询，满足条件：无论 person 是否有地址信息，都需要基于上述两表提供 person 的以下信息：
     */
    
    /*
     SELECT Person.FirstName, Person.LastName, Address.City, Address.State
     FROM Person
     LEFT JOIN Address
     ON Person.PersonId = Address.PersonId;
     */
    
    // 176. 第二高的薪水
    /*
     编写一个 SQL 查询，获取 Employee 表中第二高的薪水（Salary） 。
     +----+--------+
     | Id | Salary |
     +----+--------+
     | 1  | 100    |
     | 2  | 200    |
     | 3  | 300    |
     +----+--------+
     例如上述 Employee 表，SQL查询应该返回 200 作为第二高的薪水。如果不存在第二高的薪水，那么查询应返回 null。
     +---------------------+
     | SecondHighestSalary |
     +---------------------+
     | 200                 |
     +---------------------+
     */
    
    /*
     SELECT (SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 1, 1) AS SecondHighestSalary;
     */
    
    // 181. 超过经理收入的员工
    /*
     Employee 表包含所有员工，他们的经理也属于员工。每个员工都有一个 Id，此外还有一列对应员工的经理的 Id。
     +----+-------+--------+-----------+
     | Id | Name  | Salary | ManagerId |
     +----+-------+--------+-----------+
     | 1  | Joe   | 70000  | 3         |
     | 2  | Henry | 80000  | 4         |
     | 3  | Sam   | 60000  | NULL      |
     | 4  | Max   | 90000  | NULL      |
     +----+-------+--------+-----------+
     给定 Employee 表，编写一个 SQL 查询，该查询可以获取收入超过他们经理的员工的姓名。在上面的表格中，Joe 是唯一一个收入超过他的经理的员工。
     +----------+
     | Employee |
     +----------+
     | Joe      |
     +----------+
     */
    
    /*
     SELECT A.name AS Employee
     FROM Employee AS A
     INNER JOIN Employee AS B
     ON A.ManagerId=B.Id
     WHERE A.Salary > B.Salary;
     */
    
    // 182. 查找重复的电子邮箱
    /*
     编写一个 SQL 查询，查找 Person 表中所有重复的电子邮箱。
     示例：
     +----+---------+
     | Id | Email   |
     +----+---------+
     | 1  | a@b.com |
     | 2  | c@d.com |
     | 3  | a@b.com |
     +----+---------+
     根据以上输入，你的查询应返回以下结果：
     +---------+
     | Email   |
     +---------+
     | a@b.com |
     +---------+
     说明：所有电子邮箱都是小写字母。
     */
    
    /*
     select Email from Person group by Email having count(Email) > 1;
     
     SELECT A.Email as Email FROM
     (select Email, count(Email) as num from Person group by Email)  AS A
     WHERE A.num > 1;
     */
    
    // 183. 从不订购的客户
    /*
     某网站包含两个表，Customers 表和 Orders 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。
     Customers 表：
     +----+-------+
     | Id | Name  |
     +----+-------+
     | 1  | Joe   |
     | 2  | Henry |
     | 3  | Sam   |
     | 4  | Max   |
     +----+-------+
     Orders 表：
     +----+------------+
     | Id | CustomerId |
     +----+------------+
     | 1  | 3          |
     | 2  | 1          |
     +----+------------+
     例如给定上述表格，你的查询应返回：
     +-----------+
     | Customers |
     +-----------+
     | Henry     |
     | Max       |
     +-----------+
     */
    
}