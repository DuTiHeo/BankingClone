import SwiftUI

struct DashboardView: View {
    
    @State var viewModel: DashboardViewModel
    var body: some View {
        NavigationStack {
            content
                .padding()
                .navigationTitle("My Account")
                .task {
                    await viewModel.loadData()
                }
        }
    }
    
}

#Preview {
    let service = ApiTransactionService()
    let vm = DashboardViewModel(service: service)
    return DashboardView(viewModel: vm)
    /*
     let service = MockTransactionService(behavior: .failOnce)
     let vm = DashboardViewModel(service: service)
     DashboardView(viewModel: vm)
    */
}

