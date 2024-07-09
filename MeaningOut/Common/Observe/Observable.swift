//
//  Observable.swift
//  MeaningOut
//
//  Created by 하연주 on 7/9/24.
//

import Foundation

final class Observable<T : Any> {
    
    private var closure : ((T)->Void)?
    
    var value : T  {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    
    //직접 closure프로퍼티에 클로저 전달하지 말고
    //전달하면서 바로 실행되고! & value 바뀔때마다도 실행시켜줄 수 있게!
    func bind(closure : @escaping (T) -> Void ) {
        closure(value)
        self.closure = closure
    }
}
