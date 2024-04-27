//
//  ContentView.swift
//  HikeApp
//
//  Created by Jaydev Trivedi on 11/3/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var counterVM:  CounterViewModel = CounterViewModel()
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        
        VStack{
            Text("\(self.counterVM.value)")
        }
        
        HStack{
            Button("Increment"){
                self.counterVM.increment()
            }
            
            Button("Decrement"){
                self.counterVM.decrement()
            }
        }
    }
}

#Preview {
    ContentView()
}
