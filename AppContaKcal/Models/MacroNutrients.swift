import Foundation

struct MacroNutrients: Hashable, Codable {
    var calories: Int
    var protein: Double
    var carbs: Double
    var fats: Double

    static let zero = MacroNutrients(calories: 0, protein: 0, carbs: 0, fats: 0)

    static func + (lhs: MacroNutrients, rhs: MacroNutrients) -> MacroNutrients {
        MacroNutrients(
            calories: lhs.calories + rhs.calories,
            protein: lhs.protein + rhs.protein,
            carbs: lhs.carbs + rhs.carbs,
            fats: lhs.fats + rhs.fats
        )
    }
}
