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
}
