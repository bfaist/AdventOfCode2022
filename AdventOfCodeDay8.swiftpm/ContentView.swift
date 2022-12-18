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
        }.onAppear {
            viewModel.loadData()
        }
    }
}
