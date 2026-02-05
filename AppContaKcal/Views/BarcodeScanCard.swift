import SwiftUI

struct BarcodeScanCard: View {
    @State private var barcode = ""
    @State private var weight = ""
    @State private var macroPer100g = MacroNutrients(calories: 210, protein: 8, carbs: 32, fats: 5)

    private var calculatedMacros: MacroNutrients {
        let grams = Double(weight) ?? 0
        let factor = grams / 100
        return MacroNutrients(
            calories: Int(Double(macroPer100g.calories) * factor),
            protein: macroPer100g.protein * factor,
            carbs: macroPer100g.carbs * factor,
            fats: macroPer100g.fats * factor
        )
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Scansione codice a barre")
                .font(.headline)
            TextField("Codice a barre", text: $barcode)
                .keyboardType(.numberPad)
            TextField("Peso consumato (g)", text: $weight)
                .keyboardType(.decimalPad)

            MacroRow(macros: calculatedMacros, label: "Valori calcolati")

            Button("Simula scansione") {
                barcode = "8001234567890"
                macroPer100g = MacroNutrients(calories: 120, protein: 4, carbs: 18, fats: 3)
                weight = "180"
            }
        }
        .padding(.vertical, 4)
    }
}
