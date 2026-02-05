import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var store: DailyLogStore
    @State private var showNewRecipe = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Ricette personali")) {
                    ForEach(store.recipes) { recipe in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(recipe.name)
                                .font(.headline)
                            Text("\(recipe.servings) porzioni")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            MacroRow(macros: recipe.macrosPerServing, label: "Per porzione")
                        }
                    }
                }
            }
            .navigationTitle("Libreria")
            .toolbar {
                Button("Nuova ricetta") {
                    showNewRecipe = true
                }
            }
            .sheet(isPresented: $showNewRecipe) {
                NewRecipeView()
            }
        }
    }
}
