import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("First packet marker: ")
                Spacer()
                Text(String(viewModel.markerPosition))
            }.padding(100)
            HStack {
                Text("First message marker: ")
                Spacer()
                Text(String(viewModel.messagePosition))
            }.padding(100)
        }.onAppear() {
            viewModel.loadData()
        }
    }
}
