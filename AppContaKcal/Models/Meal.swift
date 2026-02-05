import Foundation

struct Meal: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var foods: [FoodItem]

    init(id: UUID = UUID(), name: String, foods: [FoodItem] = []) {
        self.id = id
        self.name = name
        self.foods = foods
    }

    var totalMacros: MacroNutrients {
        foods.reduce(.zero) { $0 + $1.macros }
    }
}
