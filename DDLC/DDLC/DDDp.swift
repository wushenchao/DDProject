//
//  DDDp.swift
//  DDLC
//
//  Created by 吴申超 on 2019/12/27.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class DDDp: NSObject {
    
    // 32. 最长有效括号
    func longestValidParentheses(_ s: String) -> Int {
        let ss = Array(s)
        let sc = ss.count
        if sc < 2 {
            return 0
        }
        var maxans = 0
        var dp = Array(repeating: 0, count: sc)
        for i in 1..<sc {
            if ss[i] == ")" {
                if ss[i-1] == "(" {
                    dp[i] = (i > 2 ? dp[i-2] : 0) + 2
                } else if i - dp[i-1] > 0 && ss[i - dp[i-1] - 1] == "(" {
                    dp[i] = dp[i-1] + ((i - dp[i-1]) >= 2 ? dp[i - dp[i-1] - 2] : 0) + 2
                }
                maxans = max(maxans, dp[i])
            }
        }
        return maxans
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
    
    // 63. 不同路径 ii
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        /**
         一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
         机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
         现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
         网格中的障碍物和空位置分别用 1 和 0 来表示。
         说明：m 和 n 的值均不超过 100。
         示例 1:输入:
         [
           [0,0,0],
           [0,1,0],
           [0,0,0]
         ]
         输出: 2 解释:
         3x3 网格的正中间有一个障碍物。
         从左上角到右下角一共有 2 条不同的路径：
         1. 向右 -> 向右 -> 向下 -> 向下
         2. 向下 -> 向下 -> 向右 -> 向右
         */
        if obstacleGrid.count == 0 {
            return 0
        }
        var dp = obstacleGrid
        let r = dp.count
        let c = dp[0].count
        if dp[0][0] == 1 {
            return 0
        }
        dp[0][0] = 1
        // row
        for i in 1..<r {
            if dp[i][0] == 0 && dp[i-1][0] == 1 {
                dp[i][0] = 1
            } else {
                dp[i][0] = 0
            }
        }
        // cloum
        for j in 1..<c {
            if dp[0][j] == 0 && dp[0][j-1] == 1 {
                dp[0][j] = 1
            } else {
                dp[0][j] = 0
            }
        }
        for i in 1..<r {
            for j in 1..<c {
                if dp[i][j] == 0 {
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                } else {
                    dp[i][j] = 0
                }
            }
        }
        return dp[r-1][c-1]
    }
    
    // 64. 最小路径和
    func minPathSum(_ grid: [[Int]]) -> Int {
        /**
         给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
         说明：每次只能向下或者向右移动一步。
         示例 输入:
         [
           [1,3,1],
           [1,5,1],
           [4,2,1]
         ]
         输出: 7 解释: 因为路径 1→3→1→1→1 的总和最小。
         */
//        var dps = grid
//        let r = dps.count - 1
//        let c = dps[0].count - 1
//        for i in stride(from: r, to: -1, by: -1) {
//            for j in stride(from: c, to: -1, by: -1) {
//                if i == r && j != c {
//                    dps[i][j] = dps[i][j] + dps[i][j+1]
//                } else if j == c && i != r {
//                    dps[i][j] = dps[i][j] + dps[i+1][j]
//                } else if j != c && i != r {
//                    dps[i][j] = dps[i][j] + min(dps[i+1][j], dps[i][j+1])
//                }
//            }
//        }
//        return dps[0][0]
        var dp = grid
        let r = dp.count
        let c = dp[0].count
        var sum = 0
        for i in 0..<r {
            sum += dp[i][0]
            dp[i][0] = sum
        }
        sum = 0
        for j in 0..<c {
            sum += dp[0][j]
            dp[0][j] = sum
        }
        for i in 1..<r {
            for j in 1..<c {
                dp[i][j] += min(dp[i][j-1], dp[i-1][j])
            }
        }
        return dp[r-1][c-1]
    }
    
    // 70. 爬楼梯
    func climbStairs(_ n: Int) -> Int {
        /**
         假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
         每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
         注意：给定 n 是一个正整数。
         示例 1： 输入： 2 输出： 2
         解释： 有两种方法可以爬到楼顶。
         1.  1 阶 + 1 阶
         2.  2 阶
         */
        if n < 3 {
            return n
        }
        var dp = Array(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    
    // 72. 编辑距离
    func minDistance(_ word1: String, _ word2: String) -> Int {
        /**
         给定两个单词 word1 和 word2，计算出将 word1 转换成 word2 所使用的最少操作数 。
         你可以对一个单词进行如下三种操作：
         插入一个字符
         删除一个字符
         替换一个字符
         示例 1:

         输入: word1 = "horse", word2 = "ros"
         输出: 3
         解释:
         horse -> rorse (将 'h' 替换为 'r')
         rorse -> rose (删除 'r')
         rose -> ros (删除 'e')
         */
        let l1 = word1.count
        let l2 = word2.count
        if l1 * l2 == 0 {
            return l1 + l2
        }
        let d = Array(repeating: 0, count: l2+1)
        var dp = Array(repeating: d, count: l1+1)
        for i in 0...l1 {
            dp[i][0] = i
        }
        for j in 0...l2 {
            dp[0][j] = j
        }
        let ww1 = Array(word1)
        let ww2 = Array(word2)
        for i in 1...l1 {
            for j in 1...l2 {
                let left = dp[i-1][j] + 1
                let down = dp[i][j-1] + 1
                var left_down = dp[i-1][j-1]
                if ww1[i-1] != ww2[j-1] {
                    left_down += 1
                }
                dp[i][j] = min(left, min(left_down, down))
            }
        }
        return dp[l1][l2]
    }
    
    
    // 91. 解码方法
    func numDecodings(_ s: String) -> Int {
        /**
         一条包含字母 A-Z 的消息通过以下方式进行了编码：
         'A' -> 1
         'B' -> 2
         ...
         'Z' -> 26
         给定一个只包含数字的非空字符串，请计算解码方法的总数。
         示例 1:  输入: "12"   输出: 2  解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
         示例 2:  输入: "226"  输出: 3  解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
         */
        let ss = Array(s)
        let sc = ss.count
        if sc == 0 || ss[0] == "0" {
            return 0
        }
        var dp = Array(repeating: 0, count: sc + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 1..<sc {
            if ss[i] == "0" {
                if ss[i-1] == "1" || ss[i-1] == "2" {
                    dp[i+1] = dp[i-1]
                } else {
                    return 0
                }
            } else {
                if ss[i-1] == "1" || (ss[i-1] == "2" && (Int(String(ss[i]))! <= 6 && Int(String(ss[i]))! >= 1)) {
                    dp[i+1] = dp[i] + dp[i-1]
                } else {
                    dp[i+1] = dp[i]
                }
            }
        }
        return dp[sc]
    }
    
    // 96. 不同的二叉搜索树
    func numTrees(_ n: Int) -> Int {
        /**
         给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？
         示例:  输入: 3   输出: 5
         解释:  给定 n = 3, 一共有 5 种不同结构的二叉搜索树:
            1         3     3      2      1
             \       /     /      / \      \
              3     2     1      1   3      2
             /     /       \                 \
            2     1         2                 3
         */
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += (dp[j-1] * dp[i-j])
            }
        }
        return dp[n]
    }
    
    // 120. 三角形最小路径和
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        /**
         给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
         例如，给定三角形：
         [
           [2],
           [3,4],
           [6,5,7],
           [4,1,8,3]
         ]
         自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
         */
        var dp = triangle
        for i in stride(from: dp.count - 2, to: -1, by: -1) {
            for j in 0..<dp[i].count {
                dp[i][j] += min(dp[i+1][j], dp[i+1][j+1])
            }
        }
        return dp[0][0]
    }
}
