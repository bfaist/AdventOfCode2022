//
//  StacksView.swift
//  AdventOfCodeDay5
//
//  Created by Robert Faist on 12/5/22.
//

import SwiftUI

struct StackView: View {
    let stacks: StackDataModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(stacks.stacks, id: \.self) { stack in
                VStack {
                    ForEach(stack.reversed()) { crate in
                        Text("[\(crate.crate)]")
                    }
                }
            }
        }
    }
}
