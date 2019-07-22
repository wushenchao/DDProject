//
//  DDHashTable.swift
//  DDLC
//
//  Created by 吴申超 on 2019/7/20.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDHashTable: NSObject {
    // 1. 两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        /*
         给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
         你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
         */
        // 暴力求解
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
    
    // 哈希法
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        let index = nums.count
        var maps: [Int:Int] = [:]
        for i in 0..<index {
            let value = nums[i]
            let o = target - value
            if maps.keys.contains(o) {
                return [maps[o]!, i]
            } else {
                maps[value] = i
            }
        }
        return [0]
    }
    
    // 3. 无重复字符的最长子串
    func lengthOfLongestSubstring(_ s: String) -> Int {
        /*
         给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
         */
        let n = s.count
        var ans = 0, i = 0, j = 0
        var set: [Character] = []
        var ori: [Character] = []
        for a in s {
            ori.append(a)
        }
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
    
    // 18. 四数之和
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        /*
         给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
         注意：答案中不可以包含重复的四元组。
         */
        /* 垃圾答案
        var res: [[Int]] = []
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j+1..<nums.count {
                    for l in k+1..<nums.count {
                        if nums[i] + nums[j] + nums[k] + nums[l] == target {
                            let re = [nums[i], nums[j], nums[k], nums[l]].sorted()
                            if !res.contains(re) {
                                res.append(re)
                            }
                        }
                    }
                }
            }
        }
        */
        var res: [[Int]] = []
        let n = nums.count
        if n < 4 {
            return res
        }
        let temp = nums.sorted()
        for i in 0..<n-3 {
            for j in i+1..<n-2 {
                let v34 = target - temp[i] + temp[j]
                var start = j + 1
                var end = n
                while start < end {
                    let v = temp[start] + temp[end]
                    if v > v34 {
                        end -= 1
                    }
                    else if v < v34 {
                        start += 1
                    }
                    else {
                        let va = [temp[i], temp[j], temp[start], temp[end]]
                        if !res.contains(va) {
                            res.append(va)
                        }
                        end -= 1
                        start += 1
                    }
                }
            }
        }
        return res
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
}
