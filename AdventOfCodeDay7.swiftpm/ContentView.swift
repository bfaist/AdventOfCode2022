import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State var directoryToDelete: Directory? = nil
    
    var body: some View {
        VStack {
            HStack {
                Text("Total space of directories\n with size < 100000:")
                Spacer()
                Text(String(viewModel.findDirectoriesLessThanSize(than: 100000)))
            }.padding(20)
            HStack {
                Text("Size of root dir: ")
                Spacer()
                Text(String(viewModel.sizeOfRootDir()))
            }.padding(20)
            HStack {
                Text("Size of free space: ")
                Spacer()
                Text(String(viewModel.sizeOfFreeSpace()))
            }.padding(20)
            HStack {
                Text("Min size to delete: ")
                Spacer()
                Text(String(viewModel.minSizeToDelete()))
            }.padding(20)
            HStack {
                Text("Directory to delete: ")
                Spacer()
                Text(directoryToDelete?.name ?? "Unknown")
            }.padding(20)
            HStack {
                Text("Size of directory to delete: ")
                Spacer()
                Text(String(directoryToDelete?.size() ?? 0))
            }.padding(20)
        }.onAppear() {
            viewModel.loadData()
            directoryToDelete = viewModel.findSmallestDirectoriesGreaterThanSize(than: viewModel.minSizeToDelete())
        }
    }
}
