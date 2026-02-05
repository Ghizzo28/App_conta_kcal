import Foundation

struct Recipe: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var servings: Int
    var ingredients: [FoodItem]

    init(id: UUID = UUID(), name: String, servings: Int, ingredients: [FoodItem]) {
        self.id = id
        self.name = name
        self.servings = servings
        self.ingredients = ingredients
    }

    var totalMacros: MacroNutrients {
        ingredients.reduce(.zero) { $0 + $1.macros }
    }

    var macrosPerServing: MacroNutrients {
        guard servings > 0 else { return totalMacros }
        return MacroNutrients(
            calories: totalMacros.calories / servings,
            protein: totalMacros.protein / Double(servings),
            carbs: totalMacros.carbs / Double(servings),
            fats: totalMacros.fats / Double(servings)
        )
    }
}
