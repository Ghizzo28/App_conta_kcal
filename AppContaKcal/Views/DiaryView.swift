import SwiftUI

struct DiaryView: View {
    @EnvironmentObject var store: DailyLogStore
    @State private var newMealName = ""

    var body: some View {
        NavigationView {
            List {
                Section {
                    GoalSummaryView()
                }

                Section(header: Text("Pasti")) {
                    ForEach(store.dayLog.meals) { meal in
                        NavigationLink(destination: MealDetailView(meal: meal)) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(meal.name)
                                    .font(.headline)
                                MacroRow(macros: meal.totalMacros)
                            }
                        }
                    }

                    HStack {
                        TextField("Aggiungi pasto", text: $newMealName)
                        Button("Aggiungi") {
                            guard !newMealName.isEmpty else { return }
                            store.addMeal(named: newMealName)
                            newMealName = ""
                        }
                    }
                }
            }
            .navigationTitle("Oggi")
        }
    }
}
