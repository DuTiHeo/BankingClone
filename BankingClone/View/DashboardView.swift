import SwiftUI

struct DashboardView: View {
    
    @State var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            content
                .padding()
                .navigationTitle("My Account")
        }
    }
    
}

#Preview {
    DashboardView()
}
