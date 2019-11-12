//
//  DDHeap.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/7.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDHeap: NSObject {
    func swap(_ items: inout [Int], _ lc: Int, _ rc: Int) {
        let lcV = items[lc]
        items[lc] = items[rc]
        items[rc] = lcV
    }

    /// 小顶堆
    func heapSorts(_ items: inout [Int]) {
        func adjustHeaps(_ items: inout [Int], _ count: Int, _ index: Int) {
            let lc = index * 2 + 1
            let rc = index * 2 + 2
            var tag = index
            if lc < count && items[tag] < items[lc] {
                tag = lc
            }
            if rc < count && items[tag] < items[rc] {
                tag = rc
            }
            if tag != index {
                swap(&items, tag, index)
                adjustHeaps(&items, count, tag)
            }
        }
        
        func buildSorts(_ items: inout [Int], _ count: Int) {
            for i in stride(from: count/2, to: -1, by: -1) {
                adjustHeaps(&items, count, i)
            }
        }
        let count = items.count
        buildSorts(&items, count)
        for i in stride(from: count-1, to: -1, by: -1) {
            swap(&items, i, 0)
            adjustHeaps(&items, i, 0)
        }
    }
    
    
    /// 大顶堆
    func heapSort(_ items: inout [Int]) {
        func adjustHeap(_ items: inout [Int], _ count: Int, _ index: Int) {
            let lc = index * 2 + 1
            let rc = index * 2 + 2
            var tag = index
            if lc < count && items[tag] > items[lc] {
                tag = lc
            }
            if rc < count && items[tag] > items[rc] {
                tag = rc
            }
            if tag != index {
                swap(&items, tag, index)
                adjustHeap(&items, count, tag)
            }
        }
        func buildSort(_ items: inout [Int], _ count: Int) {
            for i in stride(from: count/2, to: -1, by: -1) {
                adjustHeap(&items, count, i)
            }
        }
        let count = items.count
        buildSort(&items, count)
        
        for i in stride(from: count-1, to: -1, by: -1) {
            swap(&items, i, 0)
            adjustHeap(&items, i, 0)
        }
    }
    
    // 1046. 最后一块石头的重量
    func lastStoneWeight(_ stones: [Int]) -> Int {
        /**
         有一堆石头，每块石头的重量都是正整数。
         每一回合，从中选出两块最重的石头，然后将它们一起粉碎。假设石头的重量分别为 x 和 y，且 x <= y。那么粉碎的可能结果如下：
         如果 x == y，那么两块石头都会被完全粉碎；
         如果 x != y，那么重量为 x 的石头将会完全粉碎，而重量为 y 的石头新重量为 y-x。
         最后，最多只会剩下一块石头。返回此石头的重量。如果没有石头剩下，就返回 0。
         */
        var stone = stones
        while stone.count > 1 {
            heapSorts(&stone)
            let c = abs(stone.popLast()! - stone.popLast()!)
            if c != 0 {
                stone.append(c)
            }
        }
        return stone.count > 0 ? stone.popLast()! : 0
    }
}




class KthLargest {
    /**
    设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。
    你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。
    示例:
    int k = 3;
    int[] arr = [4,5,8,2];
    KthLargest kthLargest = new KthLargest(3, arr);
    kthLargest.add(3);   // returns 4
    kthLargest.add(5);   // returns 5
    kthLargest.add(10);  // returns 5
    kthLargest.add(9);   // returns 8
    kthLargest.add(4);   // returns 8
    */
    private var nums: [Int] = []
    private var k: Int = 0
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        let arr = nums.sorted()
        let c: Int = arr.count
        if c < k {
            self.nums = arr
        }
        else {
            
        }
    }
    
    func add(_ val: Int) -> Int {
        self.nums.append(val)
        self.nums = self.nums.sorted()
        if self.nums.count > self.k {
            self.nums.remove(at: 0)
        }
        return self.nums[0]
    }
}
