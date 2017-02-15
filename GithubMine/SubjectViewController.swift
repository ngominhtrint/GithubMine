//
//  SubjectViewController.swift
//  GithubMine
//
//  Created by TriNgo on 2/15/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa

class SubjectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       publishSubject()
    }

    func publishSubject() {
        let disposeBag = DisposeBag()
        
        let subject = PublishSubject<String>()
        
        subject.addObserver("1").addDisposableTo(disposeBag)
        subject.onNext("😎")
        subject.onNext("😛")
        
        subject.addObserver("2").addDisposableTo(disposeBag)
        subject.onNext("🅰️")
        subject.onNext("🅱️")
        
        subject.addObserver("3").addDisposableTo(disposeBag)
        subject.onNext("📒")
        subject.onNext("📘")
    }
}

extension ObservableType {
    
    func addObserver(_ id: String) -> Disposable {
        return subscribe { print("Subscription: \(id) - event: \($0)") }
    }
}




