import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            DiaryView()
                .tabItem {
                    Label("Diario", systemImage: "list.bullet.rectangle")
                }
            QuickAddView()
                .tabItem {
                    Label("Inserisci", systemImage: "plus.circle")
                }
            LibraryView()
                .tabItem {
                    Label("Libreria", systemImage: "books.vertical")
                }
            SettingsView()
                .tabItem {
                    Label("Obiettivi", systemImage: "target")
                }
        }
    }
}
