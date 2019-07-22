//
//  ViewController.swift
//  DDLC
//
//  Created by ... on 2019/3/2.
//  Copyright © 2019 .... All rights reserved.
//

import UIKit

// MARK: - Custom
extension DDBaseViewController {
    
    
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
    
    // 229. 求众数 II 摩尔排序
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
    
    // 205. 同构字符串
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        /*
         给定两个字符串 s 和 t，判断它们是否是同构的。如果 s 中的字符可以被替换得到 t ，那么这两个字符串是同构的。
         所有出现的字符都必须用另一个字符替换，同时保留字符的顺序。两个字符不能映射到同一个字符上，但字符可以映射自己本身。
         示例 1:
         输入: s = "egg", t = "add"
         输出: true
         */
        if s.count == 0 {
            return true
        }
        var tChars: [Character] = []
        for tv in t {
            tChars.append(tv)
        }
        tChars = tChars.reversed()
        var tmps: [Character: Character] = [:]
        var tmpt: [Character: Character] = [:]
        for sv in s {
            let tv: Character = tChars.popLast()!
            let tmpST: Bool = tmps.keys.contains(sv)
            let tmpTS: Bool = tmpt.keys.contains(tv)
            if (tmpST && !tmpTS) || (!tmpST && tmpTS) {
                return false
            }
            else if (tmpST && tmpTS) {
                let tmpSTV: Character = tmps[sv]!
                let tmpTSV: Character = tmpt[tv]!
                if tmpSTV != tv || tmpTSV != sv {
                    return false
                }
            }
            else {
                tmps[sv] = tv
                tmpt[tv] = sv
            }
        }
        return true
    }
    
    // 217. 存在重复元素
    func containsDuplicate(_ nums: [Int]) -> Bool {
        /*
         给定一个整数数组，判断是否存在重复元素。如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
         示例 1:
         输入: [1,2,3,1]
         输出: true
         */
        var setDatas = Set<Int>()
        for i in 0..<nums.count {
            setDatas.insert(nums[i])
            if setDatas.count != i+1 {
                return true
            }
        }
        return false
    }
    
    // 219. 存在重复元素 II
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        /*
         给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的绝对值最大为 k。
         示例 1:
         输入: nums = [1,2,3,1], k = 3
         输出: true
         */
        let total = nums.count
        if total < 2 || k < 1 {
            return false
        }
        var numsDic: [Int: Int] = [:]
        for i in 0..<total {
            if numsDic.keys.contains(nums[i]) {
                if i - numsDic[nums[i]]! <= k {
                    return true
                }
            }
            numsDic[nums[i]] = i
        }
        return false
    }
    
    // 231. 2的幂
    func isPowerOfTwo(_ n: Int) -> Bool {
        /*
         给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
         */
        
        /*
         if n < 1 {
            return false
         }
         return n & (n - 1) == 0
         */
        
        if n < 1 {
            return false
        }
        if n <= 2 {
            return true
        }
        var val = n
        while val > 0 {
            if val % 2 != 0 {
                return false
            }
            val = val / 2
            if val == 2 {
                return true
            }
        }
        return true
    }
    
    // 242. 有效的字母异位词
    func isAnagram(_ s: String, _ t: String) -> Bool {
        /*
         给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。
         示例 1: 输入: s = "anagram", t = "nagaram" 输出: true
         
         return s.sorted() = t.sorted()
         */
        if s.count != t.count {
            return false
        }
        var sChars: [Character: Int] = [:]
        for char in s {
            let count = sChars[char] ?? 0
            sChars[char] = count + 1
        }
        for char in t {
            let count = sChars[char] ?? 0
            if count == 0 {return false}
            sChars[char] = count - 1
        }
        for key in sChars.keys {
            if sChars[key] != 0 {
                return false
            }
        }
        return true
    }
    
    // 258. 各位相加
    func addDigits(_ num: Int) -> Int {
       /*
         给定一个非负整数 num，反复将各个位上的数字相加，直到结果为一位数。
         示例: 输入: 38 输出: 2
         解释: 各位相加的过程为：3 + 8 = 11, 1 + 1 = 2。 由于 2 是一位数，所以返回 2。
         进阶: 你可以不使用循环或者递归，且在 O(1) 时间复杂度内解决这个问题吗？
         */
        var tmp = num
        if tmp > 9 {
            tmp = tmp % 9
            if tmp == 0 {
                return 9
            }
        }
        return tmp
    }
    
    // 263. 丑数
    func isUgly(_ num: Int) -> Bool {
        /*
         丑数就是只包含质因数 2, 3, 5 的正整数。
         示例 1: 输入: 6 输出: true
         解释: 6 = 2 × 3
         */
        if num == 0 {
            return false
        }
        var tmp = num
        while tmp % 2 == 0 {
            tmp /= 2
        }
        while tmp % 3 == 0 {
            tmp /= 3
        }
        while tmp % 5 == 0 {
            tmp /= 5
        }
        return tmp == 1
    }
    
    // 268. 缺失数字
    func missingNumber(_ nums: [Int]) -> Int {
        /*
         给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。
         */
        var tmps = nums
        var max = nums.count
        for i in 0..<nums.count {
            max ^= tmps[i]
            max ^= i
        }
        return max
    }
    
    
    // 278. 移动零
    func moveZeroes(_ nums: inout [Int]) {
        /*
         给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
         */
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                let tmp = nums[i]
                nums[i] = nums[j]
                nums[j] = tmp
                j+=1
            }
        }
        while j < nums.count {
            nums[j] = 0
            j+=1
        }
    }
    
    // 290. 单词模式
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        /*
         给定一种 pattern(模式) 和一个字符串 str ，判断 str 是否遵循相同的模式。
         这里的遵循指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应模式。
         示例1: 输入: pattern = "abba", str = "dog cat cat dog" 输出: true
         */
        let strs = str.split(separator: " ")
        var rels: [Character: Substring] = [:]
        var index = 0
        if pattern.count != strs.count {
            return false
        }
        for char in pattern {
            let val = rels[char]
            let indexVal = strs[index]
            if val == nil {
                if rels.values.contains(indexVal) {
                    return false
                }
                rels[char] = indexVal
            }
            else if (val != nil && val! != indexVal) {
                return false
            }
            index += 1
        }
        return true
    }
    
    // 292. Nim游戏
    func canWinNim(_ n: Int) -> Bool {
        /*
         你和你的朋友，两个人一起玩 Nim游戏：桌子上有一堆石头，每次你们轮流拿掉 1 - 3 块石头。 拿掉最后一块石头的人就是获胜者。你作为先手。
         你们是聪明人，每一步都是最优解。 编写一个函数，来判断你是否可以在给定石头数量的情况下赢得游戏。
         */
        if n % 4 == 0 {
            return false
        }
        return true
    }
    
    
    // 303. 区域和检索 - 数组不可变
    class NumArray {
        /*
         给定一个整数数组  nums，求出数组从索引 i 到 j  (i ≤ j) 范围内元素的总和，包含 i,  j 两点。
         示例：给定 nums = [-2, 0, 3, -5, 2, -1]，求和函数为 sumRange()
         sumRange(0, 2) -> 1
         sumRange(2, 5) -> -1
         sumRange(0, 5) -> -3
         说明: 你可以假设数组不可变。 会多次调用 sumRange 方法。
         */
        var sums: [Int] = []
        
        init(_ nums: [Int]) {
            var tmp = 0
            for num in nums {
                tmp += num
                sums.append(tmp)
            }
        }
        
        func sumRange(_ i: Int, _ j: Int) -> Int {
            if i == 0 {
                return sums[j]
            }
            return sums[j] - sums[i-1]
        }
    }
    
    
    // 326. 3的幂
    func isPowerOfThree(_ n: Int) -> Bool {
        /*
         给定一个整数，写一个函数来判断它是否是 3 的幂次方。
         */
        if n < 1 || n == 2{
            return false
        }
        if n <= 3 {
            return true
        }
        var val = n
        while val > 0 {
            if val % 3 != 0 {
                return false
            }
            val = val / 3
            if val == 3 {
                return true
            }
        }
        return true
    }
    
    // 342. 4的幂
    func isPowerOfFour(_ num: Int) -> Bool {
        /*
         给定一个整数 (32 位有符号整数)，请编写一个函数来判断它是否是 4 的幂次方
         */
        // 小于0 或者不是2的倍数
        if num < 0 || (num&(num-1) != 0) {
            return false
        }
        // 4的幂次-1 一定是3的倍数 只是2的就余2
        return (num - 1) % 3 == 0
    }
    
    // 344. 反转字符串
    func reverseString(_ s: inout [Character]) {
        /*
         编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
         不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
         你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
         事例:
         输入：["h","e","l","l","o"]
         输出：["o","l","l","e","h"]
         */
        var last = s.count - 1
        var first = 0
        while first < last {
            let tmp = s[first]
            s[first] = s[last]
            s[last] = tmp
            first += 1
            last -= 1
        }
    }
    
    // 345. 反转字符串中的元音字母
    func reverseVowels(_ s: String) -> String {
       /*
         编写一个函数，以字符串作为输入，反转该字符串中的元音字母。
         */
        let vos: [String] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var vosIndex: [Int] = []
        var vowels: [String] = []
        var i = 0
        for vo in s {
            vowels.append(String(vo))
            if vos.contains(String(vo)) {
                vosIndex.append(i)
            }
            i += 1
        }
        var last = vosIndex.count - 1
        var first = 0
        while first < last {
            let firstIndex = vosIndex[first]
            let lastIndxe = vosIndex[last]
            let tmp = vowels[firstIndex]
            vowels[firstIndex] = vowels[lastIndxe]
            vowels[lastIndxe] = tmp
            first += 1
            last -= 1
        }
        return vowels.joined(separator: "")
    }
    
    // 349. 两个数组的交集
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /*
         给定两个数组，编写一个函数来计算它们的交集。
         示例 1:
         输入: nums1 = [1,2,2,1], nums2 = [2,2]
         输出: [2]
         */
        var res: [Int] = []
        if nums1.count > nums2.count {
            for val in nums2 {
                if nums1.contains(val) && !res.contains(val) {
                    res.append(val)
                }
            }
        }
        else {
            for val in nums1 {
                if nums2.contains(val) && !res.contains(val) {
                    res.append(val)
                }
            }
        }
        return res
    }
    
    // 350. 两个数组的交集 II
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /*
         给定两个数组，编写一个函数来计算它们的交集。
         示例 1: 输入: nums1 = [1,2,2,1], nums2 = [2,2]
         输出: [2,2]
         输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
         我们可以不考虑输出结果的顺序。
         */

        return []
    }
    
    // 367. 有效的完全平方数
    func isPerfectSquare(_ num: Int) -> Bool {
       /*
         给定一个正整数 num，编写一个函数，如果 num 是一个完全平方数，则返回 True，否则返回 False。
         说明：不要使用任何内置的库函数，如  sqrt。
         
         利用 1+3+5+7+9+…+(2n-1)=n^2，即完全平方数肯定是前n个连续奇数的和
         */
        var step = 1
        var res = num
        while res > 0 {
            res -= step
            step += 2
        }
        return res == 0
    }
    
    // 371. 两整数之和
    func getSum(_ a: Int, _ b: Int) -> Int {
        /*
         不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。
         */
        // 无进位相加
        let res = a ^ b
        // 得到进位
        let carry = (a & b) << 1
        if carry != 0 {
            return getSum(res, carry)
        }
        return res
    }
    
    // 383. 赎金信
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        /*
         给定一个赎金信 (ransom) 字符串和一个杂志(magazine)字符串，判断第一个字符串ransom能不能由第二个字符串magazines里面的字符构成。如果可以构成，返回 true ；否则返回 false。
         (题目说明：为了不暴露赎金信字迹，要从杂志上搜索各个需要的字母，组成单词来表达意思。)
         注意：
         你可以假设两个字符串均只含有小写字母。
         canConstruct("a", "b") -> false
         canConstruct("aa", "ab") -> false
         canConstruct("aa", "aab") -> true
         */
        return false
    }
    
    // 387. 字符串中的第一个唯一字符
    func firstUniqChar(_ s: String) -> Int {
        /*
         给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
         案例: s = "leetcode" 返回 0.
         s = "loveleetcode", 返回 2.
         */
        var chars: [Character] = []
        var res: [Character: Int] = [:]
        var index = 0
        for char in s {
            if res.keys.contains(char) {
                if let ind = chars.index(of: char) {
                    chars.remove(at: ind)
                }
            }
            else {
                chars.append(char)
                res[char] = index
            }
            index += 1
        }
        if chars.count == 0 {
            return -1
        }
        let char = chars[0]
        return res[char]!
    }

    // 389. 找不同
    func findTheDifference(_ s: String, _ t: String) -> Character {
        /*
         给定两个字符串 s 和 t，它们只包含小写字母。
         字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。请找出在 t 中被添加的字母。

         示例:输入：
         s = "abcd" t = "abcde"
         输出：e
         */
        var sum = 0
        for ch in s+t {
            let assiv = ch.asciiValue
            sum ^= Int(assiv!)
        }
        return Character(UnicodeScalar(sum)!)
    }
    
    // 400. 第N个数字
    func findNthDigit(_ n: Int) -> Int {
        /*
         在无限的整数序列 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...中找到第 n 个数字。
         注意: n 是正数且在32为整形范围内 ( n < 2^31)。
         示例 1: 输入: 3 输出: 3
         示例 2: 输入: 11 输出: 0
         */
        if n < 10 {
            return n
        }
        
        return 0
    }
    
    // 401. 二进制手表
    func readBinaryWatch(_ num: Int) -> [String] {
        /*
         二进制手表顶部有 4 个 LED 代表小时（0-11），底部的 6 个 LED 代表分钟（0-59）。
         每个 LED 代表一个 0 或 1，最低位在右侧。
         例如，上面的二进制手表读取 “3:25”。
         给定一个非负整数 n 代表当前 LED 亮着的数量，返回所有可能的时间。
         案例:
         输入: n = 1
         返回: ["1:00", "2:00", "4:00", "8:00", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32"]
         */
        
        func oneNum(_ num: Int) -> Int {
            var count = 0
            var n = num
            while n != 0 {
                n = n & (n-1)
                count += 1
            }
            return count
        }
        
        var res: [String] = []
        for i in 0..<12 {
            for j in 0..<60 {
                if oneNum(i) + oneNum(j) == num {
                    if j < 10 {
                        res.append("\(i):0\(j)")
                    }
                    else {
                        res.append("\(i):\(j)")
                    }
                }
            }
        }
        return res
    }
    
    // 405. 数字转换为十六进制数
    func toHex(_ num: Int) -> String {
        /*
         给定一个整数，编写一个算法将这个数转换为十六进制数。对于负整数，我们通常使用 补码运算 方法。
         注意:
         十六进制中所有字母(a-f)都必须是小写。
         十六进制字符串中不能包含多余的前导零。如果要转化的数为0，那么以单个字符'0'来表示；对于其他情况，十六进制字符串中的第一个字符将不会是0字符。
         给定的数确保在32位有符号整数范围内。
         不能使用任何由库提供的将数字直接转换或格式化为十六进制的方法。
         */
        if num == 0 {
            return "0"
        }
        let hexs = [
            "0", "1", "2", "3", "4", "5", "6", "7",
            "8", "9", "a", "b", "c", "d", "e", "f"
        ]
        var hex = num
        if num < 0 {
            hex = 1<<32 + num
        }
        var res = ""
        while hex != 0 {
            res = "\(hexs[hex % 16])" + res
            hex = hex / 16
        }
        return res
    }
    
    // 409. 最长回文串
    func longestPalindrome(_ s: String) -> Int {
        /*
         给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。
         在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。
         注意: 假设字符串的长度不会超过 1010。
         示例 1: 输入: "abccccdd"    输出: 7
         解释: 我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。
         */
        return 0
    }
    
    // 412. Fizz Buzz
    func fizzBuzz(_ n: Int) -> [String] {
        /*
         写一个程序，输出从 1 到 n 数字的字符串表示。
         1. 如果 n 是3的倍数，输出“Fizz”；
         2. 如果 n 是5的倍数，输出“Buzz”；
         3. 如果 n 同时是3和5的倍数，输出 “FizzBuzz”。
         */
        var res: [String] = []
        for i in 1...n {
            if (i % 15 == 0) {
                res.append("FizzBuzz")
            } else if (i % 3 == 0) {
                res.append("Fizz")
            } else if (i % 5 == 0) {
                res.append("Buzz")
            } else {
                res.append("\(i)")
            }
        }
        return res
    }
    
    // 414. 第三大的数
    func thirdMax(_ nums: [Int]) -> Int {
        /*
         给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。
         示例 1: 输入: [3, 2, 1] 输出: 1 解释: 第三大的数是 1.
         示例 2: 输入: [1, 2] 输出: 2 解释: 第三大的数不存在, 所以返回最大的数 2 .
         示例 3: 输入: [2, 2, 3, 1] 输出: 1 解释: 注意，要求返回第三大的数，是指第三大且唯一出现的数。存在两个值为2的数，它们都排第二。
         */
        var res: [Int] = []
        var ind = Int.min
        for num in nums {
            if ind == Int.min { ind = num }
            if res.count < 3 {
                if !res.contains(num) {
                    res.append(num)
                    if num < ind { ind = num }
                }
            }
            else {
                if num > ind {
                    res.remove(at: res.index(of: ind)!)
                    res.append(num)
                    ind = res.min()!
                }
            }
        }
        if res.count < 3 {
            return res.max()!
        }
        return ind
    }
    
    // 415. 字符串相加
    func addStrings(_ num1: String, _ num2: String) -> String {
        /*
         给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。
         注意：
         num1 和num2 的长度都小于 5100.
         num1 和num2 都只包含数字 0-9.
         num1 和num2 都不包含任何前导零。
         你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式。
         */
        var n1 = num1.reversed()
        var n2 = num2.reversed()
        if n1.count > n2.count {
            let temp = n1
            n1 = n2
            n2 = temp
        }
        var result = ""
        var z = 0
        for i in 0..<n1.count {
            let char1: Character = n1[n1.index(n1.startIndex, offsetBy: i)]
            let char2: Character = n2[n2.index(n2.startIndex, offsetBy: i)]
            var res = Int(String(char1))! + Int(String(char2))! + z
            z = 0
            if res > 9 {
                res = res - 10
                z = 1
            }
            result = "\(res)" + result
        }
        for i in n1.count..<n2.count {
            let char2: Character = n2[n2.index(n2.startIndex, offsetBy: i)]
            var res = Int(String(char2))! + z
            z = 0
            if res > 9 {
                res = res - 10
                z = 1
            }
            result = "\(res)" + result
        }
        if z != 0 {
            result = "1" + result
        }
        return result
    }
    
    // 415. 字符串相加
    func addStrings1(_ num1: String, _ num2: String) -> String {
        var arr1: [UnicodeScalar] = num1.unicodeScalars.reversed()
        var arr2: [UnicodeScalar] = num2.unicodeScalars.reversed()
        var res = ""
        var index = 0
        var carry = 0
        while index < arr1.count || index < arr2.count {
            var n1 = 0
            var n2 = 0
            if index < arr1.count {
                let char = arr1[index]
                n1 = Int(char.value) - Int("0".unicodeScalars.first!.value)
            }
            if index < arr2.count {
                let char = arr2[index]
                n2 = Int(char.value) - Int("0".unicodeScalars.first!.value)
            }
            let sum = n1 + n2 + carry
            res = String(sum % 10) + res
            carry = sum / 10
            index += 1
        }
        return res
    }
    
    // 434. 字符串中的单词数
    func countSegments(_ s: String) -> Int {
        /*
         统计字符串中的单词个数，这里的单词指的是连续的不是空格的字符。
         请注意，你可以假定字符串里不包括任何不可打印的字符。
         */
        var count = 0
        var canAdd = false
        for char in s {
            if String(char) == " " {
                if canAdd { count += 1 }
                canAdd = false
            } else {
                canAdd = true
            }
        }
        if canAdd { count += 1 }
        return count
    }
    
    
    // 438. 找到字符串中所有字母异位词
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var result: [Int] = []
        var sArr: [String] = []
        var pArr: [String:Int] = [:]
        var pCount = 0
        var tmp: [String:Int] = [:]
        for s1 in s {
            sArr.append(String(s1))
        }
        for p1 in p {
            var key: String = String(p1)
            let count: Int = pArr[key] ?? 0
            pArr[key] = count + 1
            pCount += 1
        }
        var left = 0
        var right = 0
        
        func meet_condition() -> Bool {
            // 判断是否满足条件
            for k in pArr.keys {
                let pv = pArr[k] ?? 0
                let tv = tmp[k] ?? 0
                if pv > tv {
                    return false
                }
            }
            return true
        }
        
        while right < sArr.count {
            let key: String = sArr[right]
            let count: Int = tmp[key] ?? 0
            tmp[key] = count + 1
            while(meet_condition()) {
                if right - left == pCount {
                    // 如果两个刚好相等
                    result.append(left)
                }
                let lkey: String = sArr[left]
                let v = tmp[lkey] ?? 0
                if v == 1 {
                    tmp.removeValue(forKey: lkey)
                } else {
                    tmp[lkey] = v-1
                }
                left += 1
            }
            right += 1
        }
        return result
    }
    
    // 441. 排列硬币
    func arrangeCoins(_ n: Int) -> Int {
        /*
         你总共有 n 枚硬币，你需要将它们摆成一个阶梯形状，第 k 行就必须正好有 k 枚硬币。
         给定一个数字 n，找出可形成完整阶梯行的总行数。n 是一个非负整数，并且在32位有符号整型的范围内。
         */
        var left: Int = 0
        var right: Int = n
        while left < right {
            let mid: Int = left + (right - left) / 2
            if (mid * (mid + 1) / 2 <= n) {
                left = mid
            }
            else {
                right = mid - 1
            }
        }
        return right
    }
    
    // 822. 翻转卡片游戏
    func flipgame(_ fronts: [Int], _ backs: [Int]) -> Int {
        /*
         在桌子上有 N 张卡片，每张卡片的正面和背面都写着一个正数（正面与背面上的数有可能不一样）。
         我们可以先翻转任意张卡片，然后选择其中一张卡片。
         如果选中的那张卡片背面的数字 X 与任意一张卡片的正面的数字都不同，那么这个数字是我们想要的数字。
         哪个数是这些想要的数字中最小的数（找到这些数中的最小值）呢？如果没有一个数字符合要求的，输出 0。
         其中, fronts[i] 和 backs[i] 分别代表第 i 张卡片的正面和背面的数字。
         如果我们通过翻转卡片来交换正面与背面上的数，那么当初在正面的数就变成背面的数，背面的数就变成正面的数
         输入：fronts = [1,2,4,4,7], backs = [1,3,4,1,3]
         输出：2
         */
        let count: Int = fronts.count
        var blacks: [Int] = []
        for i in 0..<count {// 获取正面or背面数字
            let fv: Int = fronts[i]
            let bv: Int = backs[i]
            if fv == bv {
                blacks.append(fv)
            }
        }
        var res = 0
        for i in 0..<count {
            let fv: Int = fronts[i]
            let bv: Int = backs[i]
            if !blacks.contains(fv) {
                if res == 0 {
                    res = fv
                }
                res = fv < res ? fv : res
            }
            if !blacks.contains(bv) {
                if res == 0 {
                    res = bv
                }
                res = bv < res ? bv : res
            }
        }
        return res
    }
    
    // 134. 加油站
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        /*
         在一条环路上有 N 个加油站，其中第 i 个加油站有汽油 gas[i] 升。
         你有一辆油箱容量无限的的汽车，从第 i 个加油站开往第 i+1 个加油站需要消耗汽油 cost[i] 升。你从其中的一个加油站出发，开始时油箱为空。
         如果你可以绕环路行驶一周，则返回出发时加油站的编号，否则返回 -1。
         说明:
         如果题目有解，该答案即为唯一答案。
         输入数组均为非空数组，且长度相同。
         输入数组中的元素均为非负数。
         示例 1:
            gas  = [1,2,3,4,5]
            cost = [3,4,5,1,2]
            输出: 3
         */
        let count = gas.count
        for i in 0..<count {
            if gas[i] >= cost[i] {
                var tempGas = gas
                var tempCost = cost
                
                var aGas: [Int] = Array(tempGas[i..<count] + tempGas[0..<i])
                var aCost: [Int] = Array(tempCost[i..<count] + tempCost[0..<i])
                var res = 0
                for j in 0..<count {
                    let gv = aGas[j]
                    let cv = aCost[j]
                    res = res + gv - cv
                    if res < 0 {
                        break
                    }
                }
                if res >= 0 {
                    return i
                }
            }
        }
        return -1
    }
    
    // 134. 加油站
    func canCompleteCircuit1(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0
        var sum = 0
        var start = 0
        let count = gas.count
        for i in 0..<count {
            total += gas[i] - cost[i]
            sum += gas[i] - cost[i]
            if sum < 0 {
                start = i+1
                sum = 0
            }
        }
        return total < 0 ? -1 : start
    }
    
    // 678. 有效的括号字符串
    #warning("fixed")
    func checkValidString(_ s: String) -> Bool {
        var star = 0
        var startLeft = 0
        var left = 0
        for chr in s {
            let v: String = String(chr)
            if v == "*" {
                if left > 0 {
                    left -= 1
                    startLeft += 1
                } else {
                    star += 1
                }
            }
            else if (v == "(") {
                left += 1
            }
            else if (v == ")") {
                if left > 0 {
                    left -= 1
                }
                else if (startLeft > 0) {
                    startLeft -= 1
                    star += 1
                }
                else {
                    return false
                }
            }
        }
        return left <= 0
    }
    
    #warning("fixed")
    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        var sentences: [String] = sentence.components(separatedBy: " ")
        var index = 0
        for s in sentences {
            for dic in dict {
                if s.starts(with: dic) {
                    sentences[index] = dic
                    break
                }
            }
            index += 1
        }
        return sentences.joined(separator: " ")
    }
    
    func containsDuplicate1(_ nums: [Int]) -> Bool {
        var k = 1
        for n in nums {
            k = n ^ k
        }
        return k == 1
    }
    
    func defangIPaddr(_ address: String) -> String {
        var str = ""
        for k in address {
            var temp_k = String(k)
            if temp_k == "." {
                temp_k = "[.]"
            }
            str += temp_k
        }
        return str
    }
    
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var res: [Int] = Array(repeatElement(0, count: n))
        for book in bookings {
            let start: Int = book[0] - 1
            let end: Int = book[1] - 1
            let count: Int = book[2]
            for i in start...end {
                let v: Int = res[i]
                res[i] = count + v
            }
        }
        return res
    }
    
//    func stoneGame(_ piles: [Int]) -> Bool {
//        var lsum = 0
//        var rsum = 0
//        var lindex = 0
//        var rindex = piles.count - 1
//        while lindex < rindex {
//            let lv = piles[lindex]
//            let rv = piles[rindex]
//            if lv > rv
//        }
//        return false
//    }
}



// MARK: - mySql
extension DDBaseViewController {
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

extension DDBaseViewController {
    // 算法
    open func algorithmTest() {
//        print(canCompleteCircuit1([1,2,3,4,5], [3,4,5,1,2]))
        print(checkValidString("(*()"))
    }
}


class MyLinkedList {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public var prev: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
            self.prev = nil
        }
    }
    var head: ListNode?
    var last: ListNode?
    
    /** Initialize your data structure here. */
    init() {
        head = ListNode(0)
        last = head
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var i = index
        var temp = head
        while temp?.next != nil && i != 0 {
            i -= 1
            temp = temp?.next
        }
        if (temp != nil) && i == 0 {
            return temp!.val
        }
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        if head?.next != nil {
            return
        }
        let node: ListNode = ListNode(val)
        head?.next = node
        node.prev = head
        last = node
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let node: ListNode = ListNode(val)
        last?.next = node
        node.prev = last
        last = node
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        
    }
}
