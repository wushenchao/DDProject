//
//  DDTop.swift
//  DDLC
//
//  Created by 吴申超 on 2019/12/18.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDTop: NSObject {
    // 1. 两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        /**
         给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
         你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
         示例:
         给定 nums = [2, 7, 11, 15], target = 9
         因为 nums[0] + nums[1] = 2 + 7 = 9
         所以返回 [0, 1]
         */
        /**
         hash
         */
        return []
    }
    
    // 2. 两数相加
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /**
         给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
         如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
         您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
         示例：
         输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
         输出：7 -> 0 -> 8
         原因：342 + 465 = 807
         */
        /**
         注意进位
         */
        return nil
    }
    
    // 3. 无重复字符的最长子串
    func lengthOfLongestSubstring(_ s: String) -> Int {
        /*
         给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
         滑动窗口法
         */
        let n = s.count
        var ans = 0, i = 0, j = 0
        var set: [Character] = []
        let ori = Array(s)
        while i < n && j < n {
            if !set.contains(ori[j]) {
                set.append(ori[j])
                j = j + 1
                ans = max(ans, j - i)
            }
            else {
                set.removeFirst()
                i = i + 1
            }
        }
        return ans
    }
    // 4. 寻找两个有序数组的中位数
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        /**
         给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
         请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
         你可以假设 nums1 和 nums2 不会同时为空。
         示例 1:
         nums1 = [1, 3]
         nums2 = [2]
         则中位数是 2.0
         示例 2:
         nums1 = [1, 2]
         nums2 = [3, 4]
         则中位数是 (2 + 3)/2 = 2.5
         */
        var numA = nums1
        var numB = nums2
        if nums1.count < nums2.count {
            numA = nums2
            numB = nums1
        }
        let half = (numA.count + numB.count + 1) / 2
        var iMin = 0
        var iMax = numA.count
        while iMin <= iMax {
            let i = (iMin + iMax)/2
            let j = half - iMin
            if i < iMax && numB[j-1] > numA[i] {
                iMin = i + 1
            } else if i > iMin && numA[i-1] > numB[j] {
                iMax = i - 1
            } else {
                var maxLeft = 0
                if i == 0 {
                    maxLeft = numB[j-1]
                } else if j == 0 {
                    maxLeft = numA[i-1]
                } else {
                    maxLeft = max(numB[j-1], numA[i-1])
                }
                var minRight = 0
                if i == numA.count {
                    minRight = numB[j]
                } else if j == numB.count {
                    minRight = numA[i]
                } else {
                    minRight = min(numB[j], numA[i])
                }
                return Double(minRight + maxLeft) / 2.0
            }
        }
        return 0.0
    }
    
    // 5. 最长回文子串
    func longestPalindrome(_ s: String) -> String {
        /**
         给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
         示例 1：
         输入: "babad"
         输出: "bab"
         注意: "aba" 也是一个有效答案。
         */
        func expandAroundCenter(_ arrs: [Character], _ left: Int, _ right: Int) -> Int {
            var L = left
            var R = right
            while L >= 0 && R < arrs.count && arrs[L] == arrs[R] {
                L = L - 1
                R = R + 1
            }
            return R - L - 1
        }
        let arrs = Array(s)
        if arrs.count == 0 {
            return ""
        }
        var start = 0
        var end = 0
        for i in 0..<arrs.count {
            let len1 = expandAroundCenter(arrs, i, i)
            let len2 = expandAroundCenter(arrs, i, i + 1)
            let len = max(len1, len2)
            if len > (end - start) {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(arrs[start...end])
    }
    
    // 6. Z 字形变换
    func convert(_ s: String, _ numRows: Int) -> String {
        /**
         将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
         比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
         L   C   I   R
         E T O E S I I G
         E   D   H   N
         之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
         请你实现这个将字符串进行指定行数变换的函数：
         string convert(string s, int numRows);
         示例 1:
         输入: s = "LEETCODEISHIRING", numRows = 3
         输出: "LCIRETOESIIGEDHN"
         */
        if numRows == 1 {
            return s
        }
        let arrs = Array(s)
        var res = ""
        let cyc = 2 * numRows - 2
        let n = arrs.count
        for i in 0..<numRows {
            for j in stride(from: 0, to: n-i, by: cyc) {
                res += "\(arrs[j+i])"
                // 去除首行、未行和超出部分
                if i != 0 && i != (numRows - 1) && j + cyc - i < n {
                    res += "\(arrs[j+cyc-i])"
                }
            }
        }
        return res
    }

    // 8. 字符串转换整数 (atoi)
    func myAtoi(_ str: String) -> Int {
        /**
         请你来实现一个 atoi 函数，使其能将字符串转换成整数。
         首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。
         当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数
         该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。
         注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。
         在任何情况下，若函数不能进行有效的转换时，请返回 0。
         说明：
         假设我们的环境只能存储 32 位大小的有符号整数，那么其数值范围为 [−231,  231 − 1]。如果数值超过这个范围，请返回  INT_MAX (231 − 1) 或 INT_MIN (−231) 。
         示例 1:
         输入: "42"
         输出: 42
         */
        
//        let temp = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
//        let arrs = Array(str)
//        var typ = 0
//        var res: [String] = []
//        for s in arrs {
//            let str = String(s)
//            if " " != str {
//                if str == "+" {
//                    if res.count > 0 { break }
//                    typ = 1
//                } else if str == "-" {
//                    if res.count > 0 { break }
//                    typ = -1
//                } else if temp.contains(str) {
//                    res.append(str)
//                } else {
//                    break
//                }
//            } else {
//                if typ != 0 || res.count > 0 {
//                    break
//                }
//            }
//        }
//        if res.count == 0 { return 0 }
        
        return 0
    }
    
    
    // 11. 盛最多水的容器
    func maxArea(_ height: [Int]) -> Int {
        /**
         给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
         说明：你不能倾斜容器，且 n 的值至少为 2。
         */
        var l = 0, v = 0
        var r = height.count - 1
        while l < r {
            let h = min(height[l], height[r])
            v = max(v, (r - l)*h)
            if (height[l] < height[r]) {
                l += 1
            } else {
                r -= 1
            }
        }
        return v
    }
    
    // 13. 罗马数字转整数
    func romanToInt(_ s: String) -> Int {
        /**
         罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
         字符          数值
         I             1
         V             5
         X             10
         L             50
         C             100
         D             500
         M             1000
         例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
         通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
         I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
         X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
         C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
         给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
         示例 1:
         输入: "III"
         输出: 3
         */
        let map = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000,
                   "IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]
        let arrs = Array(s)
        var sum = 0
        let cn = arrs.count
        var i = 0
        while i < cn {
            if i+1 < cn {
                if let v = map[String(arrs[i...i+1])] {
                    sum += v
                    i += 2
                } else {
                    sum += map[String(arrs[i])]!
                    i += 1
                }
                
            } else {
                sum += map[String(arrs[i])]!
                i += 1
            }
        }
        return sum
    }
    
    // 14. 最长公共前缀
    func longestCommonPrefix(_ strs: [String]) -> String {
        /**
         编写一个函数来查找字符串数组中的最长公共前缀。
         如果不存在公共前缀，返回空字符串 ""。
         示例 1:
         输入: ["flower","flow","flight"]
         输出: "fl"
         示例 2:
         输入: ["dog","racecar","car"]
         输出: ""
         解释: 输入不存在公共前缀。
         */
        /**
         分治、水平扫描
         */
        if strs.count == 0 {
            return ""
        }
        var temp = strs[0]
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(temp) {
                temp.removeLast()
                if temp.isEmpty {
                    return ""
                }
            }
        }
        return temp
    }
    
    // 22. 括号生成
    func generateParenthesis(_ n: Int) -> [String] {
        /**
         给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
         例如，给出 n = 3，生成结果为：
         [
           "((()))",
           "(()())",
           "(())()",
           "()(())",
           "()()()"
         ]
         */
        /** 回溯和动态规划 */
        var res: [String] = []
        func generate(_ str: String, _ left: Int, _ right: Int) {
            if str.count == 2 * n {
                res.append(str)
                return
            }
            if left < n {
                generate(str + "(", left+1, right)
            }
            if right < left {
                generate(str + ")", left, right+1)
            }
        }
        generate("", 0, 0)
        return res
    }
    
    // 29. 两数相除
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        /**
         给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
         返回被除数 dividend 除以除数 divisor 得到的商。
         示例 1:
         输入: dividend = 10, divisor = 3
         输出: 3
         示例 2:
         输入: dividend = 7, divisor = -3
         输出: -2
         */
        // 判断正负
        var dividend = dividend
        var divisor = divisor
        let sign = (dividend > 0) == (divisor > 0)
        var result = 0
        if dividend > 0 {
            dividend = -dividend
        }
        if divisor > 0 {
            divisor = -divisor
        }
        while dividend <= divisor {
            var temp_res = -1
            var temp_divisor = divisor
            while dividend <= (temp_divisor << 1) {
                if temp_divisor <= (Int.min >> 1) {
                    break
                }
                temp_res = temp_res << 1
                temp_divisor = temp_divisor << 1
            }
            dividend = dividend - temp_divisor
            result += temp_res
        }
        if sign == true {
            if result <= Int.min {
                return Int.max
            }
            result = -result
        }
        return result
    }
    
    // 33. 搜索旋转排序数组
    func search(_ nums: [Int], _ target: Int) -> Int {
        /**
         假设按照升序排序的数组在预先未知的某个点上进行了旋转。
         ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
         搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
         你可以假设数组中不存在重复的元素。
         你的算法时间复杂度必须是 O(log n) 级别。
         示例 1:
         输入: nums = [4,5,6,7,0,1,2], target = 0
         输出: 4
         示例 2:
         输入: nums = [4,5,6,7,0,1,2], target = 3
         输出: -1
         */
        /** 二分查找 */
        var i = 0
        var j = nums.count - 1
        while i <= j {
            let mid = (j - i) / 2 + i
            if target == nums[i] {
                return i
            }
            if target == nums[j] {
                return j
            }
            if target == nums[mid] {
                return mid
            }
            if nums[i] < nums[mid] {
                if target < nums[i] || target > nums[mid]{
                    i = mid + 1
                } else {
                    j = mid - 1
                }
            } else {
                if target > nums[j] || target < nums[mid] {
                    j = mid - 1
                } else {
                    i = mid + 1
                }
            }
        }
        return -1
    }
    
    // 34. 在排序数组中查找元素的第一个和最后一个位置
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        /**
         给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
         你的算法时间复杂度必须是 O(log n) 级别。
         如果数组中不存在目标值，返回 [-1, -1]。
         示例 1:
         输入: nums = [5,7,7,8,8,10], target = 8
         输出: [3,4]
         示例 2:
         输入: nums = [5,7,7,8,8,10], target = 6
         输出: [-1,-1]
         */
        var left = 0
        var right = nums.count - 1
        var res: [Int] = []
        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                var l = mid
                var r = mid
                while r < right && nums[r + 1] == target {
                    r += 1
                }
                while l > left && nums[l - 1] == target {
                    l -= 1
                }
                res.append(l)
                res.append(r)
                break
            }
        }
        return res.count > 0 ? res : [-1, -1]
    }
    
    // 36. 有效的数独
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        /**
         判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
         数字 1-9 在每一行只能出现一次。
         数字 1-9 在每一列只能出现一次。
         数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
         */
        
        return false
    }
    
    //38. 报数
    func countAndSay(_ n: Int) -> String {
        /**
         报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
         1.     1
         2.     11
         3.     21
         4.     1211
         5.     111221
         1 被读作  "one 1"  ("一个一") , 即 11。
         11 被读作 "two 1s" ("两个一"）, 即 21。
         21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
         给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。
         注意：整数顺序将表示为一个字符串。
         示例 1: 输入: 1 输出: "1"
         示例 2: 输入: 4 输出: "1211"
         */
        var prev_person = [1]
        for _ in 1..<n {
            var next_person: [Int] = []
            var num = prev_person[0]
            var count = 1
            for j in 1..<prev_person.count {
                if prev_person[j] == num {
                    count += 1
                } else {
                    next_person.append(count)
                    next_person.append(num)
                    num = prev_person[j]
                    count = 1
                }
            }
            next_person.append(count)
            next_person.append(num)
            prev_person = next_person
        }
        return String(prev_person.flatMap({String($0)}))
    }
    
    func countAndSayOne(_ n: Int) -> String {
        /** 递归 */
        if n < 1 {
            return ""
        }
        if n == 1 {
            return "1"
        } else {
            let preStr = countAndSayOne(n-1)
            var flag = preStr[preStr.startIndex]
            var count = 0
            var temp = ""
            for c in preStr {
                if c == flag {
                    count += 1
                } else {
                    temp += "\(count)\(flag)"
                    flag = c
                    count = 1
                }
            }
            temp += "\(count)\(flag)"
            return temp
        }
    }
    
    // 41. 缺失的第一个正数
    func firstMissingPositive(_ nums: [Int]) -> Int {
        /***/
        if nums.count == 0 {
            return 1
        }
        let cn = nums.count
        var nums = nums
        var i = 0
        while i < cn {
            var temp = i
            for j in i..<cn {
                let vj = nums[j]
                if vj == i+1 {
                    nums[j] = nums[i]
                    nums[i] = vj
                    temp += 1
                }
            }
            if temp == i {
                return i + 1
            }
            i += 1
        }
        return i + 1
    }
    
    func firstMissingPositiveOne(_ nums: [Int]) -> Int {
        
        return 0
    }
    
    
    // 42. 接雨水
    func trap(_ height: [Int]) -> Int {
        /**
         给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
         示例:
         输入: [0,1,0,2,1,0,1,3,2,1,2,1]
         输出: 6
         */
        /** 双指针 */
        var res = 0
        var lt = 0
        var rt = height.count - 1
        var lt_max = 0
        var rt_max = 0
        while lt < rt {
            if height[lt] < height[rt] {
                if height[lt] >= lt_max {
                    lt_max = height[lt]
                } else {
                    res += (lt_max - height[lt])
                }
                lt += 1
            } else {
                if height[rt] >= rt_max {
                    rt_max = height[rt]
                } else {
                    res += (rt_max - height[rt])
                }
                rt -= 1
            }
        }
        return res
    }
    
    
    // 46. 全排列
    func permute(_ nums: [Int]) -> [[Int]] {
        /**
         给定一个没有重复数字的序列，返回其所有可能的全排列。
         示例:
         输入: [1,2,3]
         输出:
         [
           [1,2,3],
           [1,3,2],
           [2,1,3],
           [2,3,1],
           [3,1,2],
           [3,2,1]
         ]
         */
        let cn = nums.count
        var output: [[Int]] = []
        func backtrack(_ begin: Int, _ nums: [Int]) {
            if begin == cn {
                output.append(nums)
                return
            }
            backtrack(begin + 1, nums)
            for i in begin+1..<cn {
                var temps = nums
                let v = temps[i]
                temps[i] = temps[begin]
                temps[begin] = v
                backtrack(begin + 1 , temps)
                temps[begin] = temps[i]
                temps[i] = v
            }
        }
        backtrack(0, nums)
        return output
    }
    
    
    // 48. 旋转图像
    func rotate(_ matrix: inout [[Int]]) {
        /**
         给定一个 n × n 的二维矩阵表示一个图像。
         将图像顺时针旋转 90 度。
         说明：
         你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
         示例 1:
         给定 matrix =
         [                     [
           [1,2,3],             [7,4,1],
           [4,5,6],     =>      [8,5,2],
           [7,8,9]              [9,6,3]
         ],                    ]
         */
        /**
         先转置在翻转
         [                   [                [
           [1,2,3],           [1,4,7]          [7,4,1],
           [4,5,6],     =>    [2,5,8],   =>    [8,5,2],
           [7,8,9]            [3,6,9]          [9,6,3]
         ],                  ]                ]
         */
        let cn = matrix.count
        for i in 0..<cn {
            for j in i..<cn {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
            // 等同于下面的for循环
            matrix[i].reverse()
        }
//        for i in 0..<cn {
//            for j in 0..<cn/2 {
//                let temp = matrix[i][j]
//                matrix[i][j] = matrix[i][cn-j-1]
//                matrix[i][cn-j-1] = temp
//            }
//        }
        
    }
    
    // 49. 字母异位词分组
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        /**
         给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
         示例:
         输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
         输出:
         [
           ["ate","eat","tea"],
           ["nat","tan"],
           ["bat"]
         ]
         */
        return []
    }
    
    // 53. 最大子序和
    func maxSubArray(_ nums: [Int]) -> Int {
        /**
         给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
         示例:
         输入: [-2,1,-3,4,-1,2,1,-5,4],
         输出: 6
         解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
         */
        
        let cn = nums.count
        var currSum = 0
        var maxSum = Int.min
        for i in 0..<cn {
            currSum = max(nums[i], currSum + nums[i])
            maxSum = max(maxSum, currSum)
        }
        return maxSum
        
//        func crossSum(_ nums: [Int], _ left: Int, _ right: Int, _ p: Int) -> Int {
//            if left == right {
//                return nums[left]
//            }
//            var leftSum = Int.min
//            var currSum = 0
//            for i in stride(from: p, to: left, by: -1) {
//                currSum += nums[i]
//                leftSum = max(currSum, leftSum)
//            }
//            var rightSum = Int.min
//            currSum = 0
//            for i in stride(from: p + 1, to: right + 1, by: 1) {
//                currSum += nums[i]
//                rightSum = max(currSum, rightSum)
//            }
//            return leftSum + rightSum
//        }
//
//        func helper(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
//            if left == right {
//                return nums[left]
//            }
//            let p = (left + right) / 2
//            let leftSum = helper(nums, left, p)
//            let rightSum = helper(nums, p+1, right)
//            let cc = crossSum(nums, left, right, p)
//            return max(max(leftSum, rightSum), cc)
//        }
//
//        return helper(nums, 0, nums.count - 1)
    }
    
    // 54. 螺旋矩阵
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        /**
         给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
         示例 1: 输入:
         [
          [ 1, 2, 3 ],
          [ 4, 5, 6 ],
          [ 7, 8, 9 ]
         ]
         输出: [1,2,3,6,9,8,7,4,5]
         */
        var outPut: [Int] = []
        let cn = matrix.count
        if cn == 0 {
            return outPut
        }
        var left = 0
        var right = matrix[0].count - 1
        var top = 0
        var bottom = cn - 1
        while left <= right && top <= bottom {
            for i in left...right {
                // 上（0...n）
                outPut.append(matrix[top][i])
            }
            if top < bottom {
                // 右（1...n）
                for j in top+1...bottom {
                    outPut.append(matrix[j][right])
                }
            }
            if left < right && top < bottom {
                // 下 (n-1...1)
                for i in stride(from: right-1, to: left, by: -1) {
                    outPut.append(matrix[bottom][i])
                }
                // 左 (0...n-1)
                for j in stride(from: bottom, to: top, by: -1) {
                    outPut.append(matrix[j][left])
                }
            }
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        return outPut
    }
    
    // 55. 跳跃游戏
    func canJump(_ nums: [Int]) -> Bool {
        /**
         给定一个非负整数数组，你最初位于数组的第一个位置。
         数组中的每个元素代表你在该位置可以跳跃的最大长度。
         判断你是否能够到达最后一个位置。
         示例 1:
         输入: [2,3,1,1,4]
         输出: true
         解释: 我们可以先跳 1 步，从位置 0 到达 位置 1, 然后再从位置 1 跳 3 步到达最后一个位置。
         */
        
        /** 动态规划、贪心、回硕 */
        return false
    }
    
    
    // 56. 合并区间
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        /**
         给出一个区间的集合，请合并所有重叠的区间。
         示例 1:
         输入: [[1,3],[2,6],[8,10],[15,18]]
         输出: [[1,6],[8,10],[15,18]]
         解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
         */
        if intervals.count == 0 {
            return []
        }
        // 排序
        let sortInter = Array(Set(intervals)).sorted { (first, second) -> Bool in
            if first[0] == second[0] {
                return first[1] < second[1]
            } else {
                return first[0] < second[0]
            }
        }
        var outPut: [[Int]] = []
        var curr = sortInter[0]
        for i in 1..<sortInter.count {
            let temp = sortInter[i]
            if curr.last! >= temp.first! {
                if curr.last! < temp.last! {
                    curr[1] = temp[1]
                }
            } else {
                outPut.append(curr)
                curr = temp
            }
        }
        outPut.append(curr)
        return outPut
    }
    
    // 62. 不同路径
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        /**
         一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
         机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
         问总共有多少条不同的路径？
         */
        /**
         动态规划
         */
        let n1 = Array(repeating: 0, count: n)
        var m1 = Array(repeating: n1, count: m)
        for i in 0..<n {
            m1[0][i] = 1
        }
        for j in 0..<m {
            m1[j][0] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                m1[i][j] = m1[i-1][j] + m1[i][j-1]
            }
        }
        return m1[m-1][n-1]
    }
    
    // 73. 矩阵置零
    func setZeroes(_ matrix: inout [[Int]]) {
        /**
         给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。
         示例 1: 输入:
         [
           [1,1,1],
           [1,0,1],
           [1,1,1]
         ]
         输出:
         [
           [1,0,1],
           [0,0,0],
           [1,0,1]
         ]
         */
        if matrix.count < 0 {
            return
        }
        let R = matrix.count
        let C = matrix[0].count
        var isCol = false
        for i in 0..<R {
            if matrix[i][0] == 0 {
                isCol = true
            }
            for j in 1..<C {
                if matrix[i][j] == 0 {
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
        for i in 1..<R {
            for j in 1..<C {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        if matrix[0][0] == 0 {
            for j in 0..<C {
                matrix[0][j] = 0
            }
        }
        if isCol {
            for i in 0..<R {
                matrix[i][0] = 0
            }
        }
    }
    
    
    // 75. 颜色分类
    func sortColors(_ nums: inout [Int]) {
        /**
         给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
         此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
         注意:  不能使用代码库中的排序函数来解决这道题。
         示例:
         输入: [2,0,2,1,1,0]
         输出: [0,0,1,1,2,2]
         */
        let count = nums.count
        var curr = 0
        var left = 0
        var right = count - 1
        while curr <= right {
            if nums[curr] == 0 {
                nums[curr] = nums[left]
                nums[left] = 0
                left += 1
                curr += 1
            } else if nums[curr] == 2 {
                nums[curr] = nums[right]
                nums[right] = 2
                right -= 1
            } else {
                curr += 1
            }
        }
        
        // 76. 最小覆盖子串
        func minWindow(_ s: String, _ t: String) -> String {
            /**
             给你一个字符串 S、一个字符串 T，请在字符串 S 里面找出：包含 T 所有字母的最小子串。
             示例：
             输入: S = "ADOBECODEBANC", T = "ABC"
             输出: "BANC"
             说明：
             如果 S 中不存这样的子串，则返回空字符串 ""。
             如果 S 中存在这样的子串，我们保证它是唯一的答案。
             */
            
            return ""
        }
        
        
        // 22. 括号生成
        func generateParenthesis(_ n: Int) -> [String] {
            /**
             给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
             例如，给出 n = 3，生成结果为：
             [
               "((()))",
               "(()())",
               "(())()",
               "()(())",
               "()()()"
             ]。
             */
            var res: [String] = []
            func generate(_ str: String, _ left: Int, _ right: Int) {
                if str.count == 2 * n {
                    res.append(str)
                    return
                }
                if left < n {
                    generate(str + "(", left+1, right)
                }
                if right < left {
                    generate(str + ")", left, right+1)
                }
            }
            generate("", 0, 0)
            return res
        }
        
        func subsets(_ nums: [Int]) -> [[Int]] {
            
            var res: [[Int]] = []
            func subset(_ temp: [Int], _ index: Int) {
                if index == nums.count {
                    res.append(temp)
                    return
                }
                subset(temp, index + 1)
                let v = nums[index]
                var ttemp: [Int] = temp
                ttemp.append(v)
                subset(ttemp, index + 1)
            }
            subset([], 0)
            return res
        }
    }
}
