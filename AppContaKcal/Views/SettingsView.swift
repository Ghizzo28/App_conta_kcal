import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var store: DailyLogStore
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fats = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Obiettivo giornaliero")) {
                    TextField("Calorie", text: $calories)
                        .keyboardType(.numberPad)
                    TextField("Proteine (g)", text: $protein)
                        .keyboardType(.decimalPad)
                    TextField("Carboidrati (g)", text: $carbs)
                        .keyboardType(.decimalPad)
                    TextField("Grassi (g)", text: $fats)
                        .keyboardType(.decimalPad)

                    Button("Aggiorna obiettivo") {
                        let goal = MacroNutrients(
                            calories: Int(calories) ?? store.dayLog.dailyGoal.calories,
                            protein: Double(protein) ?? store.dayLog.dailyGoal.protein,
                            carbs: Double(carbs) ?? store.dayLog.dailyGoal.carbs,
                            fats: Double(fats) ?? store.dayLog.dailyGoal.fats
                        )
                        store.updateDailyGoal(goal)
                    }
                }

                Section(header: Text("Personalizzazione")) {
                    Text("Puoi aggiungere pasti liberi dal diario giornaliero e creare ricette personalizzate.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Obiettivi")
            .onAppear {
                let goal = store.dayLog.dailyGoal
                calories = String(goal.calories)
                protein = String(format: "%.0f", goal.protein)
                carbs = String(format: "%.0f", goal.carbs)
                fats = String(format: "%.0f", goal.fats)
            }
        }
    }
}
