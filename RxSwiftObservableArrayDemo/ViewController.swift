//
//  ViewController.swift
//  RxSwiftObservableArrayDemo
//
//  Created by huangjianwu on 2017/8/4.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit
import ObservableArray_RxSwift
import RxSwift

struct UserName {
    var userName = "name"
}

class ViewController: UIViewController {
    let bag:DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self._test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - test
    
    func _test()  {
        var array: ObservableArray<UserName> = [UserName.init(userName: "go"), UserName.init(userName: "dan"), UserName.init(userName: "jia")]
        
        array.rx_events().subscribe(onNext: {item in
            print(item)
        }).addDisposableTo(bag)

        //可监测append
        array.append(UserName.init(userName: "coffee"))
        //可监测替换
        array[2] = UserName.init(userName: "milk")
        //可监测修改
        array[2].userName = "dark"
        //可监测删除
        array.removeAll()
    }

}

