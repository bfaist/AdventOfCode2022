import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            if viewModel.dataLoaded {
                HStack {
                    Text("My Total Score - Part 1")
                    Spacer()
                    Text(String(viewModel.gameRoundsPart1.myTotalScore()))
                }.padding(50)
                HStack {
                    Text("My Total Score - Part 2")
                    Spacer()
                    Text(String(viewModel.gameRoundsPart2.myTotalScore()))
                }.padding(50)
            } else {
                Button {
                    viewModel.loadData()
                } label: {
                    Text("Load Strategy Guide Data")
                }.buttonStyle(.bordered)
            }
        }
    }
}
