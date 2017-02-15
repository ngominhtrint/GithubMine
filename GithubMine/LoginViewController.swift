//
//  LoginViewController.swift
//  GithubMine
//
//  Created by TriNgo on 2/15/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import Foundation
import UIKit
import Moya
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        never()
//        empty()
//        just()
//        of()
//        from()
//        create()
//        repeatElement()
//        generate()
//        doOn()
    }

    // Create a sequence that never emits any events and never terminates.
    func never() {
        let disposeBag = DisposeBag()
        let neverSequence = Observable<String>.never()
        let neverSequenceSubsciption = neverSequence
            .subscribe { _ in
                print("This will never be printed")
        }
        
        neverSequenceSubsciption.addDisposableTo(disposeBag)
    }
    
    // Create an empty Observable sequence that only emits a Complete event
    // Console >> completed
    func empty() {
        let disposeBag = DisposeBag()
        
        Observable<Int>.empty()
            .subscribe { event in
                print(event)
            }
            .addDisposableTo(disposeBag)
    }
    
    // Create an Observable sequence with a single event
    // Console >> next(🐻)
    // Console >> completed
    func just() {
        let disposeBag = DisposeBag()

        Observable<String>.just("🐻")
            .subscribe { event in
                print(event)
            }
            .addDisposableTo(disposeBag)
    }
    
    // Create an Observable sequence with a fixed number of event
    func of() {
        let disposeBag = DisposeBag()
        
        Observable<String>.of("🐶", "🐱", "🐭", "🐹")
            .subscribe(onNext: { pet in
                print(pet)
            })
            .addDisposableTo(disposeBag)
    }
    
    // Create an Observable sequence from a SequenceType, such as an Array, Dictionary and Set
    func from() {
        let disposeBag = DisposeBag()

        Observable.from(["🐶", "🐱", "🐭", "🐹"])
            .subscribe(onNext: { print($0) })
            .addDisposableTo(disposeBag)
    }
    
    // Create a custom Observable sequence
    func create() {
        let disposeBag = DisposeBag()
        let myJust = { (element: String) -> Observable<String> in
            return Observable.create { observer in
                observer.onNext(element)
                observer.onCompleted()
                return Disposables.create()
            }
        }
        
        let myJusts = { (elements: [String]) -> Observable<[String]> in
            return Observable.create { observer in
                observer.onNext(elements)
                observer.onCompleted()
                return Disposables.create()
            }
        }
        
        myJust("😇")
            .subscribe { print($0) }
            .addDisposableTo(disposeBag)
        
        myJusts(["This","is","an","Array"])
            .subscribe(onNext: { print($0) })
            .addDisposableTo(disposeBag)
    }

    // Create an Observable sequence that emits the given element indefinitely
    func repeatElement() {
        let disposeBag = DisposeBag()
        
        Observable.repeatElement("CoderSchool")
            .take(5)
            .subscribe { print($0) }
            .addDisposableTo(disposeBag)
    }
    
    // Create an Observable sequence that generates values for as long as the provided condition eveluates to true
    func generate() {
        let disposeBag = DisposeBag()
        
        Observable.generate(initialState: 60, condition: { $0 < 100 } , iterate: { $0 + 5 })
            .subscribe(onNext: { print($0) })
            .addDisposableTo(disposeBag)
    }
    
    // Invokes a side-effect action for each emitted event and return (passes through) the origin event
    func doOn() {
        let disposeBag = DisposeBag()
        Observable.of("🍎", "🍐", "🍊", "🍋")
            .do(onNext: { print("Intercepted", $0) }, onError: { print("Intercepted error", $0) }, onCompleted: { print("Compplete") })
            .subscribe { print($0) }
            .addDisposableTo(disposeBag)
    }
    
    
    
}




