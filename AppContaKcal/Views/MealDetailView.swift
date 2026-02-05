import SwiftUI

struct MealDetailView: View {
    @EnvironmentObject var store: DailyLogStore
    var meal: Meal

    @State private var showQuickAdd = false

    var body: some View {
        List {
            Section(header: Text("Riepilogo")) {
                MacroRow(macros: meal.totalMacros)
            }

            Section(header: Text("Alimenti")) {
                ForEach(meal.foods) { food in
                    VStack(alignment: .leading) {
                        Text(food.name)
                            .font(.headline)
                        Text(food.servingDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        MacroRow(macros: food.macros)
                    }
                    .padding(.vertical, 4)
                }

                Button("Aggiungi rapido") {
                    showQuickAdd = true
                }
            }
        }
        .navigationTitle(meal.name)
        .sheet(isPresented: $showQuickAdd) {
            QuickAddSheet(meal: meal)
        }
    }
}
