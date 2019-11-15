//
//  DDSort.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/15.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDSort: NSObject {
    
    /// 350. 两个数组的交集 II
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /**
         给定两个数组，编写一个函数来计算它们的交集。
         示例 1: 输入: nums1 = [1,2,2,1], nums2 = [2,2]
         输出: [2,2]
         示例 2: 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
         输出: [4,9]
         */
        if nums1.count == 0 || nums2.count == 0 {
            return []
        }
        var dic1: [Int: Int] = [:]
        for num in nums1 {
            dic1[num] = (dic1[num] ?? 0) + 1
        }
        var res: [Int] = []
        for num in nums2 {
            if dic1[num] != nil && dic1[num]! > 0 {
                res.append(num)
                dic1[num]! -= 1
            }
        }
        return res
    }
    
    /// 922. 按奇偶排序数组 II
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        /**
         给定一个非负整数数组 A， A 中一半整数是奇数，一半整数是偶数。
         对数组进行排序，以便当 A[i] 为奇数时，i 也是奇数；当 A[i] 为偶数时， i 也是偶数。
         你可以返回任何满足上述条件的数组作为答案。
         示例：
         输入：[4,2,5,7]
         输出：[4,5,2,7]
         解释：[4,7,2,5]，[2,5,4,7]，[2,7,4,5] 也会被接受。
         */
        var res = A
        var end = A.count - 1
        for i in stride(from: 0, to: A.count, by: 2) {
            let v = res[i]
            if v % 2 != 0 {
                for j in stride(from: end, to: 0, by: -2) {
                    if res[j] % 2 == 0 {
                        end = j
                        res[i] = res[j]
                        res[j] = v
                        break
                    }
                }
            }
        }
        return res
    }
}
