//
//  DDHomeViewController.swift
//  DDLC
//
//  Created by ... on 2019/3/25.
//  Copyright © 2019 .... All rights reserved.
//

import UIKit

class DDHomeViewController: DDBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.algorithmTest()
        let heap = DDHeap()
        var items = [1, 2, 4, 6, 3, 5]
        heap.heapSorts(&items)
        print(items)
        heap.heapSort(&items)
        print(items)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
