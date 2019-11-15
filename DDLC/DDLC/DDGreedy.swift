//
//  DDGreedy.swift
//  DDLC
//
//  Created by 吴申超 on 2019/11/12.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDGreedy: NSObject {

    func swap(_ items: inout [Int], _ lc: Int, _ rc: Int) {
        let lcV = items[lc]
        items[lc] = items[rc]
        items[rc] = lcV
    }
    
    func quickSort(_ datas: inout [Int]) {
        
        func partition(_ datas: inout [Int], _ start: Int, _ end: Int) -> Int {
            let pivort = datas[start]
            var j = start
            for i in start+1..<end {
                if datas[i] < pivort {
                    j += 1
                    swap(&datas, i, j)
                }
            }
            swap(&datas, start, j)
            return j
        }
        
        func quickSortT(_ datas: inout [Int], _ start: Int, _ end: Int) {
            if start < end {
                swap(&datas, start, end-1)
                let m = partition(&datas, start, end)
                quickSortT(&datas, start, m)
                quickSortT(&datas, m+1, end)
            }
        }
        quickSortT(&datas, 0, datas.count)
    }
    
    /// 122. 买卖股票的最佳时机 II
    func maxProfit(_ prices: [Int]) -> Int {
        /**
         给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
         设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
         注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
         示例 1: 输入: [7,1,5,3,6,4] 输出: 7
         解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
              随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
         */
        if prices.count < 1 {
            return 0
        }
        var total = 0
        for i in 1..<prices.count {
            let v = prices[i] - prices[i-1]
            if v > 0 {
                total = total + v
            }
        }
        return total
    }

    /// 392. 判断子序列
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        /**
         给定字符串 s 和 t ，判断 s 是否为 t 的子序列。
         你可以认为 s 和 t 中仅包含英文小写字母。字符串 t 可能会很长（长度 ~= 500,000），而 s 是个短字符串（长度 <=100）。
         字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。
         示例 1: s = "abc", t = "ahbgdc" 返回 true.
         示例 2: s = "axc", t = "ahbgdc" 返回 false.
         后续挑战: 如果有大量输入的 S，称作S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？
         */
        /**
         var ss = Array(s)
         var tt = Array(t)
         while ss.count > 0 && tt.count > 0 {
             while tt.count > 0 && ss.last != tt.last {
                 let _ = tt.popLast()
             }
             if tt.count > 0 {
                 let _ = tt.popLast()
                 let _ = ss.popLast()
             }
         }
         return ss.count == 0
         */
        let ss = Array(s)
        let tt = Array(t)
        var index = 0
        for i in 0..<tt.count {
            if index < ss.count {
                if ss[index] == tt[i] {
                    index += 1
                }
            }
            else {
                break
            }
        }
        return index == ss.count
    }
    
    /// 455. 分发饼干
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        /**
         假设你是一位很棒的家长，想要给你的孩子们一些小饼干。但是，每个孩子最多只能给一块饼干。对每个孩子 i ，都有一个胃口值 gi ，这是能让孩子们满足胃口的饼干的最小尺寸；并且每块饼干 j ，都有一个尺寸 sj 。如果 sj >= gi ，我们可以将这个饼干 j 分配给孩子 i ，这个孩子会得到满足。你的目标是尽可能满足越多数量的孩子，并输出这个最大数值。
         注意：你可以假设胃口值为正。 一个小朋友最多只能拥有一块饼干。
         输入: [1,2,3], [1,1]
         输出: 1 解释: 你有三个孩子和两块小饼干，3个孩子的胃口值分别是：1,2,3。
         虽然你有两块小饼干，由于他们的尺寸都是1，你只能让胃口值是1的孩子满足。
         所以你应该输出1。
         */
        if g.count == 0 || s.count == 0 {
            return 0
        }
        var gs = g
        var ss = s
        quickSort(&gs)
        quickSort(&ss)
        var gi = 0
        for ssv in ss {
            if gi < gs.count && ssv >= gs[gi] {
                gi += 1
            }
        }
        return gi
    }
    
    /// 860. 柠檬水找零
    func lemonadeChange(_ bills: [Int]) -> Bool {
        /**
         在柠檬水摊上，每一杯柠檬水的售价为 5 美元。
         顾客排队购买你的产品，（按账单 bills 支付的顺序）一次购买一杯。
         每位顾客只买一杯柠檬水，然后向你付 5 美元、10 美元或 20 美元。你必须给每个顾客正确找零，也就是说净交易是每位顾客向你支付 5 美元。
         注意，一开始你手头没有任何零钱。如果你能给每位顾客正确找零，返回 true ，否则返回 false 。
         示例 1：
             输入：[5,5,5,10,20]
             输出：true
             解释：
             前 3 位顾客那里，我们按顺序收取 3 张 5 美元的钞票。
             第 4 位顾客那里，我们收取一张 10 美元的钞票，并返还 5 美元。
             第 5 位顾客那里，我们找还一张 10 美元的钞票和一张 5 美元的钞票。
             由于所有客户都得到了正确的找零，所以我们输出 true。
         */
        var five = 0
        var ten = 0
        for bill in bills {
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                if five > 0 {
                    five -= 1
                    ten += 1
                } else {
                    return false
                }
            } else if bill == 20 {
                if ten > 0 {
                    ten -= 1
                    if five > 0 {
                        five -= 1
                    } else {
                        return false
                    }
                }
                else if five > 3 {
                    five -= 3
                }
                else {
                    return false
                }
            }
        }
        return true
    }
    
    /// 874. 模拟行走机器人
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        /**
         机器人在一个无限大小的网格上行走，从点 (0, 0) 处开始出发，面向北方。该机器人可以接收以下三种类型的命令：
         -2：向左转 90 度
         -1：向右转 90 度
         1 <= x <= 9：向前移动 x 个单位长度
         在网格上有一些格子被视为障碍物。
         第 i 个障碍物位于网格点  (obstacles[i][0], obstacles[i][1])
         如果机器人试图走到障碍物上方，那么它将停留在障碍物的前一个网格方块上，但仍然可以继续该路线的其余部分。
         返回从原点到机器人的最大欧式距离的平方。
         示例 1：
             输入: commands = [4,-1,3], obstacles = []
             输出: 25
             解释: 机器人将会到达 (3, 4)
         */
        
        return 0
    }
}
