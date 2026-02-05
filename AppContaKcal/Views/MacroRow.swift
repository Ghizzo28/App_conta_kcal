import SwiftUI

struct MacroRow: View {
    var macros: MacroNutrients
    var label: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let label {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            HStack(spacing: 16) {
                MacroPill(title: "Proteine", value: macros.protein, unit: "g")
                MacroPill(title: "Carbo", value: macros.carbs, unit: "g")
                MacroPill(title: "Grassi", value: macros.fats, unit: "g")
            }
        }
    }
}

struct MacroPill: View {
    var title: String
    var value: Double
    var unit: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text("\(value, specifier: "%.0f") \(unit)")
                .font(.subheadline)
        }
        .padding(8)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
