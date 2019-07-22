//
//  DDLinkTable.swift
//  DDLC
//
//  Created by 吴申超 on 2019/7/20.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class DDLinkTable: NSObject {
    // 2. 两数相加
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /*
         给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
         如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
         您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
         */
        let head: ListNode? = ListNode(0)
        var pre = head
        var l1 = l1
        var l2 = l2
        var tmp = 0
        while l1 != nil || l2 != nil {
            let vl1 = l1?.val ?? 0
            let vl2 = l2?.val ?? 0
            var v = vl1 + vl2 + tmp
            tmp = v / 10
            v = v % 10
            l1 = l1?.next
            l2 = l2?.next
            pre?.next = ListNode(v)
            pre = pre?.next
        }
        if tmp != 0 {
            pre?.next = ListNode(tmp)
        }
        return head?.next
    }
    
    // 19. 删除链表的倒数第N个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        /*
         给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
         */
        let pre: ListNode? = ListNode(0)
        pre?.next = head
        var first = pre
        var second = pre
        var num = n
        while num != 0 {
            num -= 1
            second = second?.next
        }
        while second?.next != nil {
            second = second?.next
            first = first?.next
        }
        first?.next = first?.next?.next
        return pre?.next
    }
    
    // 21. 合并两个有序链表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /*
         将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
         */
        let head :ListNode? = ListNode(0)
        var pre = head
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                pre?.next = l1
                l1 = l1?.next
            }
            else {
                pre?.next = l2
                l2 = l2?.next
            }
            pre = pre?.next
        }
        pre?.next = l1 == nil ? l2 : l1
        return head?.next
    }
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /*
         将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
         */
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
    
    // 24. 两两交换链表中的节点
    func swapPairs(_ head: ListNode?) -> ListNode? {
        /*
         给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
         你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
         给定 1->2->3->4, 你应该返回 2->1->4->3.
         */
        let pre : ListNode? = ListNode(0)
        pre?.next = head
        var temp = pre
        while temp?.next != nil && temp?.next?.next != nil {
            let node1 = temp?.next
            let node2 = temp?.next?.next
            temp?.next = node2
            node1?.next = node2?.next
            node2?.next = node1
            temp = node1
        }
        return pre?.next
    }
    
    // 61. 旋转链表
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        /*
         给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
         输入: 1->2->3->4->5->NULL, k = 2
         输出: 4->5->1->2->3->NULL
         解释:
         向右旋转 1 步: 5->1->2->3->4->NULL
         向右旋转 2 步: 4->5->1->2->3->NULL
         */
        if head == nil || head?.next == nil {
            return head
        }
        var pre = head
        var count = 1
        while pre?.next != nil {
            pre = pre?.next
            count += 1
        }
        // 首尾相连(新首节点为尾部节点)
        pre?.next = head
        var step = count - k % count
        while step != 0 {
            step -= 1
            pre = pre?.next
        }
        let newHead = pre?.next
        pre?.next = nil
        return newHead
    }
    
    // 82. 删除排序链表中的重复元素
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        /*
         给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
         输入: 1->2->3->3->4->4->5
         输出: 1->2->5
         */
        let pre: ListNode? = ListNode(0)
        pre?.next = head
        var del = false
        var pre_node = pre
        var cur_node = pre?.next
        while cur_node != nil && cur_node?.next != nil {
            if cur_node?.val == cur_node?.next?.val {
                del = true
                cur_node?.next = cur_node?.next?.next
            }
            else {
                if del == true {
                    del = false
                    pre_node?.next = cur_node?.next
                    cur_node = pre_node?.next
                }
                else {
                    cur_node = cur_node?.next
                    pre_node = pre_node?.next
                }
            }
        }
        if del == true {
            pre_node?.next = cur_node?.next
        }
        return pre?.next
    }
    
    // 83. 删除排序链表中的重复元素
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        /*
         给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
         输入: 1->2->3->3->4->4->5
         输出: 1->2->3->4->5
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
    
    // 86. 分隔链表
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        /*
         给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或
         等于 x 的节点之前。你应当保留两个分区中每个节点的初始相对位置。
         示例:
         输入: head = 1->4->3->2->5->2, x = 3
         输出: 1->2->2->4->3->5
         */
        let pre_l: ListNode? = ListNode(0)
        let pre_r: ListNode? = ListNode(0)
        var pre_ll = pre_l
        var pre_rr = pre_r
        var temp_head = head
        while temp_head != nil {
            let v: Int = temp_head!.val
            if v < x {
                pre_ll?.next = ListNode(v)
                pre_ll = pre_ll?.next
            }
            else  {
                pre_rr?.next = ListNode(v)
                pre_rr = pre_rr?.next
            }
            temp_head = temp_head?.next
        }
        pre_ll?.next = pre_r?.next
        return pre_l?.next
    }
    
    // 92. 反转链表 II
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        /*
         反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
         说明: 1 ≤ m ≤ n ≤ 链表长度。
         示例: 输入: 1->2->3->4->5->NULL, m = 2, n = 4 输出: 1->4->3->2->5->NULL
         */
        var pre: ListNode? = ListNode(0)
        pre?.next = head
        var temp_node: ListNode? = ListNode(0)
        var i = 0
        while i < n {
            i += 1
            if i == m {
                temp_node = pre
            }
            if i > m {
                let c_pre = pre
                c_pre?.next = temp_node?.next
                temp_node?.next = c_pre
            }
            pre = pre?.next
        }
        return pre?.next
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
    
    // 203. 移除链表元素
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        /*
         删除链表中等于给定值 val 的所有节点。
         示例:
         输入: 1->2->6->3->4->5->6, val = 6
         输出: 1->2->3->4->5
         */
        if head == nil {
            return nil
        }
        head?.next = removeElements(head?.next, val)
        return head?.val == val ? head?.next : head
    }
    
    // 204. 计数质数
    func countPrimes(_ n: Int) -> Int {
        /*
         统计所有小于非负整数 n 的质数的数量。
         示例: 输入: 10 输出: 4
         解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
         厄拉多塞筛法:
         比如说求20以内质数的个数,首先0,1不是质数.2是第一个质数,然后把20以内所有2的倍数划去.
         2后面紧跟的数即为下一个质数3,然后把3所有的倍数划去.3后面紧跟的数即为下一个质数5,再把5所有的倍数划去.
         */
        if n < 3 {
            return 0
        }
        var outs = [Int](repeating: 1, count: n)
        print(outs)
        outs[0] = 0
        outs[1] = 0
        for i in 2..<Int(sqrt(Double(n))) + 1 {
            if outs[i] == 1 {
                var index = i
                var tmp = i * index
                while tmp < n {
                    outs[tmp] = 0
                    index += 1
                    tmp = index * i
                }
            }
        }
        let sum: Int = outs.reduce(0, +)
        return sum
    }
    
    // 206. 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        /*
         反转一个单链表。
         示例:
         输入: 1->2->3->4->5->NULL
         输出: 5->4->3->2->1->NULL
         */
        if head == nil || head?.next == nil {
            return head
        }
        let node = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return node
    }
    
    // 206. 反转链表
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var tmpHead = head
        var result: ListNode?
        while tmpHead != nil {
            let val = tmpHead?.val
            let node = ListNode(val!)
            node.next = result
            result = node
            tmpHead = tmpHead?.next
        }
        return result
    }
    
    // 234. 回文链表
    func isPalindrome(_ head: ListNode?) -> Bool {
        /*
         请判断一个链表是否为回文链表
         */
        var fast = head
        var slow = head
        var prev: ListNode?
        // 找到中点
        while fast != nil {
            fast = fast?.next != nil ? fast!.next!.next : fast?.next
            slow = slow?.next
        }
        // 反转后半部分
        while slow != nil {
            let tmp = slow?.next
            slow?.next = prev
            prev = slow
            slow = tmp
        }
        // 比较
        var tmpHead = head
        while tmpHead != nil && prev != nil {
            if tmpHead?.val != prev?.val {
                return false
            }
            tmpHead = tmpHead?.next
            prev = prev?.next
        }
        return true
    }
    
    // 328. 奇偶链表
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var odd = head
        var even = head?.next
        let temp = even
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            // even?.next = even?.next?.next 同下
            even?.next = odd?.next
            even = even?.next
        }
        odd?.next = temp
        return head
    }
    
    // 445. 两数相加 II
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1v: [Int] = []
        var l2v: [Int] = []
        var l1t = l1
        var l2t = l2
        while l1t != nil {
            l1v.append(l1t!.val)
            l1t = l1t?.next
        }
        while l2t != nil {
            l2v.append(l2t!.val)
            l2t = l2t?.next
        }
        var carry = 0
        let pre: ListNode? = ListNode(0)
        while l1v.count != 0 || l2v.count != 0 || carry != 0 {
            let v1: Int = l1v.popLast() ?? 0
            let v2: Int = l2v.popLast() ?? 0
            let res = (v1 + v2 + carry) % 10
            carry = (v1 + v2 + carry) / 10
            let a = ListNode(res)
            a.next = pre?.next
            pre?.next = a
        }
        return pre?.next
    }
    
    // 876. 链表的中间结点
    func middleNode(_ head: ListNode?) -> ListNode? {
        /*
         给定一个带有头结点 head 的非空单链表，返回链表的中间结点。
         如果有两个中间结点，则返回第二个中间结点。
         */
        var midle = head
        var tmp = head
        while tmp != nil {
            if tmp?.next == nil {
                break
            }
            midle = midle?.next
            tmp = tmp?.next?.next
        }
        return midle
    }
}
