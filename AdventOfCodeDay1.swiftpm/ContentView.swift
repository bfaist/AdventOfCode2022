import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.dataLoaded {
                VStack {
                    topElfView
                    top3ElfsView
                }
            } else {
                loadButton
            }
        }
    }
    
    var loadButton: some View {
        Button {
            viewModel.retrieveData()
        } label: {
            Text("Load Elf Data")
        }
    }
    
    var topElfView: some View {
        VStack {
            HStack {
                Text("Top Elf: ")
                Spacer()
                Text(String(viewModel.model.topElf()?.id ?? 0))
            }.padding()
            HStack {
                Text("Total Calories: ")
                Spacer()
                Text(String(viewModel.model.topElf()?.totalCalories ?? 0))
            }.padding()
        }
    }
    
    var top3ElfsView: some View {
        VStack {
            Text("Top 3 Elfs")
            
            ForEach(viewModel.model.topElfs(3), id: \.id) { topElf in
                HStack {
                    Text(String(topElf.id))
                    Spacer()
                    Text(String(topElf.totalCalories))
                }.padding()
            }
            
            Text("Total Calories for top 3 Elfs")
            
            Text(String(viewModel.model.topElfs(3).totalCalories()))
        }
    }
}
