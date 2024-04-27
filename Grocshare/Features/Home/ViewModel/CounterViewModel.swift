//
//  CounterViewModel.swift
//  Grocshare
//
//  Created by Jaydev Trivedi on 12/3/2024.
//

import Foundation

class CounterViewModel: ObservableObject {
    
    @Published var counter: Counter = Counter(value: 0)
    
    var value: Int {
        return self.counter.value
    }
    
    func increment(){
        self.counter.increment()
    }
    
    func decrement() {
        self.counter.decrement()
    }
}
