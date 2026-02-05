import SwiftUI

struct QuickAddSheet: View {
    @EnvironmentObject var store: DailyLogStore
    @Environment(\.dismiss) private var dismiss
    var meal: Meal

    @State private var name = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fats = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Dettagli alimento")) {
                    TextField("Nome alimento", text: $name)
                    TextField("Calorie", text: $calories)
                        .keyboardType(.numberPad)
                    TextField("Proteine (g)", text: $protein)
                        .keyboardType(.decimalPad)
                    TextField("Carboidrati (g)", text: $carbs)
                        .keyboardType(.decimalPad)
                    TextField("Grassi (g)", text: $fats)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Inserimento rapido")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salva") {
                        let macros = MacroNutrients(
                            calories: Int(calories) ?? 0,
                            protein: Double(protein) ?? 0,
                            carbs: Double(carbs) ?? 0,
                            fats: Double(fats) ?? 0
                        )
                        let item = FoodItem(name: name, servingDescription: "Porzione personalizzata", macros: macros)
                        store.addFood(item, to: meal)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annulla") {
                        dismiss()
                    }
                }
            }
        }
    }
}
