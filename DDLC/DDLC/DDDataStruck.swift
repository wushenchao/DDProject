//
//  DDDataStruck.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/19.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

/// Array
class DDDataStruck: NSObject {
    
    // 实现一个支持动态扩容数组
    // 实现一个大小固定的有序数组，支持动态增删改查
    // 实现两个有序数组合并为一个有序数组
    
    /// 双指针
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var a = m - 1
        var b = n - 1
        var c = m + n - 1
        while a >= 0 && b >= 0 {
            if nums1[a] > nums2[b] {
                nums1[c] = nums1[a]
                a -= 1
            } else {
                nums1[c] = nums2[b]
                b -= 1
            }
            c -= 1
        }
        while b >= 0 {
            nums1[c] = nums2[b]
            b -= 1
            c -= 1
        }
    }
    
    
    // 15. 三数之和 https://leetcode-cn.com/problems/3sum/
    func threeSum(_ nums: [Int]) -> [[Int]] {
        return []
    }
    
    // 41. 缺失的第一个正数 https://leetcode-cn.com/problems/first-missing-positive/
    func firstMissingPositive(_ nums: [Int]) -> Int {
        return 0
    }
}

extension DDDataStruck {
    // 实现单链表、循环链表、双向链表，支持增删操作
    // 实现单链表反转
    // 实现两个有序的链表合并为一个有序链表
    // 实现求链表的中间节点
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode?
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
    
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head: ListNode? = ListNode(0)
        var prev = head
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                prev?.next = l1
                l1 = l1?.next
            } else {
                prev?.next = l2
                l2 = l2?.next
            }
            prev = prev?.next
        }
        prev?.next = l1 != nil ? l1 : l2
        return head?.next
    }
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else {
            if l1!.val < l2!.val {
                l1?.next = mergeTwoLists(l1?.next, l2)
                return l1
            } else {
                l2?.next = mergeTwoLists(l1, l2?.next)
                return l2
            }
        }
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var quick = head
        while quick?.next != nil {
            quick = quick?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    // 141. 环形链表 https://leetcode-cn.com/problems/linked-list-cycle/
    func hasCycle(_ head: ListNode?) -> Bool {
//        if head == nil {
//            return false
//        }
//        var slow = head
//        var quick = head
//        while quick != nil && quick?.next != nil {
//            if quick != head {
//                quick = quick?.next?.next
//                slow = slow?.next
//            }
//        }
        return false
    }
    
    // 合并 k 个 有序链表 https://leetcode-cn.com/problems/merge-k-sorted-lists/
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        let head: ListNode? = ListNode(0)
        var prev = head
        var nodes: [Int] = []
        for list in lists {
            var l = list
            while l != nil {
                nodes.append(l!.val)
                l = l?.next
            }
        }
        let arr = nodes.sorted()
        for a in arr {
            prev?.next = ListNode(a)
            prev = prev?.next
        }
        return head?.next
    }
}

extension DDDataStruck {
    /**
     栈
     用数组实现一个顺序栈
     用链表实现一个顺序栈
     编程模拟实现一个浏览器前进、后退功能
     */
    
    /**
     队列
     用数组实现一个顺序队列
     用链表实现一个链式队列
     实现一个循环队列
     */
    
    /**
     递归
     编程实现斐波那契数列求值 f(n)=f(n-1)+f(n-2)
     编程实现求阶乘 n!
     编程实现一组数据集合的全排列
     */
    
    // 20. 有效的括号 https://leetcode-cn.com/problems/valid-parentheses/
    func isValid(_ s: String) -> Bool {
        let dic = ["}": "{", "]": "[", ")": "("]
        var arr: [String] = []
        for s1 in s {
            let c = String(s1)
            let v = dic[c]
            if v == nil {
                arr.append(c)
            } else if v != arr.popLast() {
                return false
            }
        }
        return arr.count == 0
    }
    
    // 32. 最长有效括号 https://leetcode-cn.com/problems/longest-valid-parentheses/
    func longestValidParentheses(_ s: String) -> Int {
        return 0
    }
    
    // 150. 逆波兰表达式求值 https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/
    func evalRPN(_ tokens: [String]) -> Int {
        return 0
    }
}



extension DDDataStruck {
    
    func firstEqual(_ items: [Int], _ item: Int) -> Int {
        var low = 0
        var high = items.count - 1
        while low <= high {
            let mid = (high - low) >> 1 + low
            if items[mid] > item {
                high = mid - 1
            } else if items[mid] < item {
                low = mid + 1
            } else {
                if mid == 0 || items[mid-1] != item {
                    return mid
                } else {
                    high = mid - 1
                }
            }
        }
        return -1
    }
    
    func lastEqual(_ items: [Int], _ item: Int) -> Int {
        var low = 0
        var high = items.count - 1
        while low <= high {
            let mid = (high - low) >> 1 + low
            if items[mid] > item {
                high = mid - 1
            } else if items[mid] < item {
                low = mid + 1
            } else {
                if mid == items.count-1 || items[mid+1] != item {
                    return mid
                } else {
                    low = mid + 1
                }
            }
        }
        return -1
    }
    
    func firstMaxEqual(_ items: [Int], _ item: Int) -> Int {
        var low = 0
        var high = items.count - 1
        while low <= high {
            let mid = (high - low) >> 1 + low
            if items[mid] >= item {
                if mid == 0 || items[mid-1] < item {
                    return mid
                } else {
                    high = mid - 1
                }
            } else {
                low = mid + 1
            }
        }
        return -1
    }
    
    func lastMinEqual(_ items: [Int], _ item: Int) -> Int {
        var low = 0
        var high = items.count - 1
        while low <= high {
            let mid = (high - low) >> 1 + low
            if items[mid] <= item {
                if mid == items.count - 1 || items[mid + 1] > item {
                    return mid
                }
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return 0
    }
}
