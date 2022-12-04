//
//  RuckSackView.swift
//  AdventOfCodeDay3
//
//  Created by Robert Faist on 12/3/22.
//

import SwiftUI

struct RuckSackView: View {
    let ruckSack: RuckSack
    
    var body: some View {
        VStack {
            HStack {
                Text("1: ")
                Spacer()
                Text(ruckSack.compartment1)
            }.padding(.horizontal)
            HStack {
                Text("2: ")
                Spacer()
                Text(ruckSack.compartment2)
            }.padding(.horizontal)
            HStack {
                Text("Common Item Type: ")
                Spacer()
                Text(ruckSack.commonItemType()?.type ?? "?")
            }.padding(.horizontal)
            HStack {
                Text("Priority: ")
                Spacer()
                Text(String(ruckSack.commonItemType()?.priority ?? 0))
            }.padding(.horizontal)
        }
        .border(.black)
        .cornerRadius(20)
    }
}
