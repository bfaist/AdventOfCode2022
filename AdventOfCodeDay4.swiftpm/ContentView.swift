import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.isDataLoaded {
                HStack {
                    Text("Combined Ranges: ")
                    Spacer()
                    Text(String(viewModel.schedule.countCombinedRanges()))
                }.padding(50)
                HStack {
                    Text("Overlapping Ranges: ")
                    Spacer()
                    Text(String(viewModel.schedule.countOverlapRanges()))
                }.padding(50)
            } else {
                Button {
                    viewModel.loadData()
                } label: {
                    Text("Load Data")
                }
            }
        }
    }
}
