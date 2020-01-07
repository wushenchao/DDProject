//
//  DDHot.swift
//  DDLC
//
//  Created by 吴申超 on 2019/12/3.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDHot: NSObject {
    
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
        /**
         给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
         示例 1:
         输入: "abcabcbb"
         输出: 3
         解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
         示例 2:
         输入: "bbbbb"
         输出: 1
         解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
         示例 3:
         输入: "pwwkew"
         输出: 3
         解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
              请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
         */
        /**
         
         */
        return 0
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
//        let count1 = nums1.count
//        let count2 = nums2.count
//        var result: [Int] = []
//        var i = 0
//        var j = 0
//        while i + j <= (count1 + count2)/2 {
//            if i < count1 && j < count2 {
//                if nums1[i] < nums2[j] {
//                    result.append(nums1[i])
//                    i += 1
//                } else {
//                    result.append(nums2[j])
//                    j += 1
//                }
//            } else {
//                if i < count1 {
//                    result.append(nums1[i])
//                    i += 1
//                } else {
//                    result.append(nums2[j])
//                    j += 1
//                }
//            }
//        }
//        if (count1 + count2) % 2 == 0 {
//            return Double(result.popLast()! + result.popLast()!) / 2.0
//        } else {
//            return Double(result.last!)
//        }
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
         示例 2：
         输入: "cbbd"
         输出: "bb"
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
    
    // 10. 正则表达式匹配
    func isMatch(_ s: String, _ p: String) -> Bool {
        /**
         给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。
         '.' 匹配任意单个字符
         '*' 匹配零个或多个前面的那一个元素
         所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。
         说明:
         s 可能为空，且只包含从 a-z 的小写字母。
         p 可能为空，且只包含从 a-z 的小写字母，以及字符 . 和 *。
         示例 1:
         输入:
         s = "aa"
         p = "a"
         输出: false
         解释: "a" 无法匹配 "aa" 整个字符串。
         */
        return false
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
    
    // 15. 三数之和
    func threeSum(_ nums: [Int]) -> [[Int]] {
        /**
         给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
         注意：答案中不可以包含重复的三元组。
         例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
         满足要求的三元组集合为：
         [
           [-1, 0, 1],
           [-1, -1, 2]
         ]
         */
        if nums.count < 3 {
            return []
        }
        let datas = nums.sorted()
        var res: [[Int]] = []
        for i in 0..<datas.count {
            if datas[i] > 0 {
                return res
            }
            if i > 0 && datas[i]==datas[i-1] {
                continue
            }
            var l = i + 1
            var r = datas.count - 1
            while l < r {
                let v = datas[l] + datas[r] + datas[i]
                if v == 0 {
                    res.append([datas[l], datas[r], datas[i]])
                    while l < r && datas[l] == datas[l+1] {
                        l = l + 1
                    }
                    while l < r && datas[r] == datas[r-1] {
                        r = r - 1
                    }
                    l = l + 1
                    r = r - 1
                } else if v > 0 {
                    r = r - 1
                } else {
                    l = l + 1
                }
            }
        }
        return res
    }
    
    // 22. 括号生成
    func generateParenthesis(_ n: Int) -> [String] {
        /**
         给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
         例如，给出 n = 3，生成结果为：
         */
        var res: [String] = []
        func generateHDFS(_ str: String, _ left: Int, _ right: Int) {
            if str.count == 2 * n {
                res.append(str)
                return
            }
            if left < n {
                generateHDFS(str + "(", left+1, right)
            }
            if right < left {
                generateHDFS(str + ")", left, right+1)
            }
        }
        generateHDFS("", 0, 0)
        return res
    }
    
    // 31. 下一个排列
    func nextPermutation(_ nums: inout [Int]) {
        /**
        实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
        如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
        必须原地修改，只允许使用额外常数空间。
        以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
        1,2,3 → 1,3,2
        3,2,1 → 1,2,3
        1,1,5 → 1,5,1
        */
    }
    
    // 33. 搜索旋转排序数组
    func search(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        if n == 0 {
            return -1
        }
        if n == 1 {
            return nums[0] == target ? 0 : -1
        }
        func find_rotate_index(_ l: Int, _ r: Int) -> Int {
            // 查找分割点
            if nums[l] < nums[r] {
                return 0
            }
            var left = l
            var right = r
            while left <= right {
                let pivot = (right - left) / 2 + left
                if nums[pivot] > nums[pivot + 1] {
                    return pivot + 1
                } else {
                    if nums[pivot] < nums[pivot - 1] {
                        right = pivot - 1
                    } else {
                        left = pivot + 1
                    }
                }
            }
            return -1
        }
        func search(_ l: Int, _ r: Int) -> Int {
            var left = l
            var right = r
            while left <= right {
                let pivot = (right - left) / 2 + left
                if nums[pivot] == target {
                    return pivot
                } else {
                    if target < nums[pivot] {
                        right = pivot - 1
                    } else {
                        left = pivot + 1
                    }
                }
            }
            return -1
        }
        
        let rotate_index = find_rotate_index(0, n-1)
        if nums[rotate_index] == target {
            return rotate_index
        }
        if rotate_index == 0 {
            return search(0, n-1)
        }
        if target < nums[0] {
            return search(rotate_index, n-1)
        }
        return search(0, rotate_index)
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
    
    // 39. 组合总和
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        /**
         给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
         candidates 中的数字可以无限制重复被选取。
         说明：
         所有数字（包括 target）都是正整数。
         解集不能包含重复的组合。
         示例 1:
         输入: candidates = [2,3,6,7], target = 7,
         所求解集为:
         [
           [7],
           [2,2,3]
         ]
         */
        
        func combineSum(_ target: Int, _ sums: [Int], _ i: Int) {
            var ss = sums;
        }
        combineSum(target, [], 0)
        return []
    }
}

