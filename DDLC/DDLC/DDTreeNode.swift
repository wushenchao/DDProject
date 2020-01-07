//
//  DDHashTable.swift
//  DDLC
//
//  Created by 吴申超 on 2019/7/20.
//  Copyright © 2019 DengYun. All rights reserved.
//

import UIKit

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class DDTreeNode: NSObject {
    // 100. 相同的树
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil  {
            return true
        }
        if p != nil && q != nil && p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false;
    }
    
    // 101. 对称的二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        /*
         给定一个二叉树，检查它是否是镜像对称的。例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
         */
        if root == nil {
            return true
        }
        func isSymmeTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil  {
                return true
            }
            if left != nil && right != nil && left?.val == right?.val {
                return isSymmeTree(left?.left, right?.right) && isSymmeTree(left?.right, right?.left)
            }
            return false
        }
        return isSymmeTree(root?.left, root?.right)
    }
    
    // 104. 二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        /*
         给定一个二叉树，找出其最大深度。二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
         说明: 叶子节点是指没有子节点的节点。
         */
        /*
         if root == nil {
         return 0
         }
         func depth(_ left: TreeNode?, _ right: TreeNode?, _ dep: Int) -> Int {
         if left != nil || right != nil {
         let dep = dep + 1
         return max(depth(left?.left, left?.right, dep), depth(right?.left, right?.right, dep))
         }
         return dep
         }
         return depth(root?.left, root?.right, 1)
         */
        return root == nil ? 0 : max(maxDepth(root?.left) + 1, maxDepth(root?.right) + 1)
    }
    
    // 107. 二叉树的层次遍历 II
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        /*
         给定一个二叉树，返回其节点值自底向上的层次遍历。（即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
         */
        if root == nil {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(root!)
        while !queue.isEmpty {
            var count = queue.count
            var tmp: [Int] = []
            while count != 0 {
                let node = queue.removeFirst()
                tmp.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                count -= 1
            }
            result.append(tmp)
        }
        return result.reversed()
    }
    
    // 108. 将有序数组转换为二叉搜索树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        /*
         将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
         本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1
         */
        return nil
    }
    
    // 110. 平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        /*
         给定一个二叉树，判断它是否是高度平衡的二叉树。
         本题中，一棵高度平衡二叉树定义为：一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
         */
        if root == nil {
            return true
        }
        /*
         let leftDepth: Int = maxDepth(root?.left)
         let rightDepth: Int = maxDepth(root?.right)
         let diff: Int = leftDepth - rightDepth
         if diff > 1 || diff < -1 {
         return false
         }
         return isBalanced(root?.left) && isBalanced(root?.right)
         */
        var depth: Int = 0
        return isBalanceTreeOnce(root, &depth)
    }
    
    func isBalanceTreeOnce(_ root: TreeNode?, _ depth: inout Int) -> Bool {
        if root == nil {
            depth = 0
            return true
        }
        var leftDepth: Int = 0
        var rightDepth: Int = 0
        if isBalanceTreeOnce(root?.left, &leftDepth) && isBalanceTreeOnce(root?.right, &rightDepth) {
            let diff: Int = leftDepth - rightDepth
            if diff <= 1 && diff >= -1 {
                depth = leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1
                return true
            }
        }
        return false
    }
    
    
    // 111. 二叉树的最小深度
    func minDepth(_ root: TreeNode?) -> Int {
        /*
         给定一个二叉树，找出其最小深度。
         最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
         说明: 叶子节点是指没有子节点的节点。
         */
        if root == nil {
            return 0
        }
        let minLeft = minDepth(root?.left)
        let minRight = minDepth(root?.right)
        if ((root?.left) != nil) && ((root?.right) != nil) {
            return min(minLeft, minRight) + 1
        }
        return 1 + minLeft + minRight
    }
    
    // 112. 路径总和
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        /*
         给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
         说明: 叶子节点是指没有子节点的节点。
         示例: 给定如下二叉树，以及目标和 sum = 22，
         */
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil && sum == root?.val {
            return true
        }
        return hasPathSum(root?.left, sum - root!.val) || hasPathSum(root?.right, sum-root!.val)
    }
    
    // 226. 翻转二叉树
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        let temp = invertTree(root?.left)
        root?.left = invertTree(root?.right)
        root?.right = temp
        return root
    }
    
    // 404. 左叶子之和
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        /*
         计算给定二叉树的所有左叶子之和。
         */
        func sumOfLeaves(_ root: TreeNode?, _ left: Bool) -> Int {
            if root == nil {
                return 0
            }
            if root?.left == nil && root?.right == nil {
                return left ? root!.val : 0
            }
            return sumOfLeaves(root?.left, true) + sumOfLeaves(root?.right, false)
        }
        
        if root == nil {
            return 0
        }
        return sumOfLeaves(root?.left, true) + sumOfLeaves(root?.right, false)
    }
    
    
    // 437. 路径总和 III
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        /*
         给定一个二叉树，它的每个结点都存放着一个整数值。找出路径和等于给定数值的路径总数。
         路径不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。
         二叉树不超过1000个节点，且节点数值范围是 [-1000000,1000000] 的整数。
         */
        guard root != nil else {
            return 0
        }
        func _dfs(_ res: inout Int, _ root: TreeNode?, _ s: Int) {
            guard root != nil else {
                return
            }
            var s = s
            s += root?.val ?? 0
            if s == sum {
                res += 1
            }
            _dfs(&res, root?.left, s)
            _dfs(&res, root?.right, s)
        }
        var res = 0
        _dfs(&res, root, 0)
        return pathSum(root?.left, sum) + pathSum(root?.right, sum) + res
    }


    // 144. 二叉树的前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        func helper(_ root: TreeNode?) {
            if root != nil {
                res.append(root!.val)
                helper(root?.left)
                helper(root?.right)
            }
        }
        helper(root)
        return res
    }
    
    // 94. 二叉树的中序遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        return inorderTraversal(root!.left) + [root!.val] + inorderTraversal(root!.right)
    }
    
    // 102. 二叉树的层次遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(root!)
        while !queue.isEmpty {
            var count = queue.count
            var temp: [Int] = []
            while count != 0 {
                let node = queue.removeFirst()
                temp.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                count -= 1
            }
            result.append(temp)
        }
        return result
    }
    func levelOrder1(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var result: [[Int]] = []
        func helper(_ node: TreeNode, _ level: Int) {
            if result.count == level {
                result.append([])
            }
            result[level].append(node.val)
            if node.left != nil {
                helper(node.left!, level+1)
            }
            if node.right != nil {
                helper(node.right!, level+1)
            }
        }
        helper(root!, 0)
        return result
    }
    
}



class DDTrie: NSObject {
    /**
     trie 树构建条件
     1: 字符集不能太大，存储空间浪费很多
     2: 字符串的前缀重合比较多，不然空间消耗大
     3: 需要自己构建 trie 树，比较复杂
     4: 指针串起来的数据不是连续的，对缓存不友好
     
     优化方式: 缩点优化
     trie树不适合精确匹配查找，这种适合散列表和红黑树
     trie树适合查找前缀匹配字符串
     */
    class TrieNode {
        public var val: String?
        // 初始化一个26个空占位
        public var children: [TrieNode] = Array(repeating: TrieNode(nil), count: 26)
        // 是否是叶子结点
        public var isEndingChar: Bool = false
        public init(_ val: String?) {
            self.val = val
        }
        func isNull() -> Bool {
            return self.val == nil
        }
    }
    
    fileprivate let root: TrieNode = TrieNode("/")
    
    func insert(_ S: String) {
        var head = root
        for s in S {
            let index: Int = Int(s.asciiValue!) - 97
            if head.children[index].isNull() {
                head.children[index] = TrieNode(String(s))
            }
            head = head.children[index]
        }
        head.isEndingChar = true
    }
    
    func find(_ pattern: String) -> Bool {
        var head = root
        for p in pattern {
            let index: Int = Int(p.asciiValue!) - 97
            if head.children[index].isNull() {
                return false
            }
            head = head.children[index]
        }
        if !head.isEndingChar {
            return false
        }
        return true
    }
    
}
