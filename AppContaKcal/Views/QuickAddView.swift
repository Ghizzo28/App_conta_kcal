import SwiftUI

struct QuickAddView: View {
    @EnvironmentObject var store: DailyLogStore
    @State private var selectedMealId: UUID?
    @State private var name = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fats = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Inserimento rapido")) {
                    Picker("Pasto", selection: $selectedMealId) {
                        ForEach(store.dayLog.meals) { meal in
                            Text(meal.name).tag(Optional(meal.id))
                        }
                    }
                    TextField("Nome alimento", text: $name)
                    TextField("Calorie", text: $calories)
                        .keyboardType(.numberPad)
                    TextField("Proteine (g)", text: $protein)
                        .keyboardType(.decimalPad)
                    TextField("Carboidrati (g)", text: $carbs)
                        .keyboardType(.decimalPad)
                    TextField("Grassi (g)", text: $fats)
                        .keyboardType(.decimalPad)

                    Button("Salva") {
                        guard let meal = store.dayLog.meals.first(where: { $0.id == selectedMealId }) else { return }
                        let macros = MacroNutrients(
                            calories: Int(calories) ?? 0,
                            protein: Double(protein) ?? 0,
                            carbs: Double(carbs) ?? 0,
                            fats: Double(fats) ?? 0
                        )
                        let item = FoodItem(name: name, servingDescription: "Porzione personalizzata", macros: macros)
                        store.addFood(item, to: meal)
                        clearFields()
                    }
                }

                Section(header: Text("Barcode & peso")) {
                    BarcodeScanCard()
                }
            }
            .navigationTitle("Inserisci")
        }
        .onAppear {
            if selectedMealId == nil {
                selectedMealId = store.dayLog.meals.first?.id
            }
        }
    }

    private func clearFields() {
        name = ""
        calories = ""
        protein = ""
        carbs = ""
        fats = ""
    }
}
