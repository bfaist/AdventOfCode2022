import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.isDataLoaded {
                    HStack {
                        Text("Priority Sum (part 1):")
                        Spacer()
                        Text(String(viewModel.ruckSacks.prioritySum()))
                    }.padding(.horizontal)
                    HStack {
                        Text("Priority Sum (part 2):")
                        Spacer()
                        Text(String(viewModel.ruckSackGroups.prioritySum()))
                    }.padding(.horizontal)
                    ForEach(viewModel.ruckSacks, id: \.id) { rucksack in
                        RuckSackView(ruckSack: rucksack)
                    }
                    ForEach(viewModel.ruckSackGroups, id: \.id) { group in
                        HStack {
                            Text("Group Priority: ")
                            Text(String(group.commonItemType()?.priority ?? 0))
                        }
                    }
                } else {
                    Spacer()
                    Button {
                        viewModel.loadData()
                    } label: {
                        Text("Load Data")
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
            }
        }
    }
}
