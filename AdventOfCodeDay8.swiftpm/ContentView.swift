import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Visible Tree Count: ")
                Spacer()
                Text(String(viewModel.visibleTreeCount))
            }.padding(50)
            HStack {
                Text("Max Scenic Score: ")
                Spacer()
                Text(String(viewModel.highestScenicTreeScore))
            }.padding(50)
        }.onAppear {
            viewModel.loadData()
        }
    }
}
