import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            if viewModel.isDataMoved {
                VStack {
                    Text(viewModel.stacks.topStacks())
                        .padding(.vertical, 50)
                    StackView(stacks: viewModel.stacks)
                        .padding(.vertical, 50)
                }
            }
            Button {
                viewModel.makeMovesPart1()
            } label: {
                Text("Make Moves - Part 1")
            }.buttonStyle(.bordered)
            
            Button {
                viewModel.makeMovesPart2()
            } label: {
                Text("Make Moves - Part 2")
            }.buttonStyle(.bordered)
        }.onAppear() {
            viewModel.loadData()
        }
    }
}
