import SwiftUI

@main
struct AppContaKcalApp: App {
    @StateObject private var store = DailyLogStore()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(store)
        }
    }
}
