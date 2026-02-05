import Foundation

struct DayLog: Identifiable, Hashable, Codable {
    let id: UUID
    var date: Date
    var dailyGoal: MacroNutrients
    var meals: [Meal]

    init(id: UUID = UUID(), date: Date = Date(), dailyGoal: MacroNutrients, meals: [Meal]) {
        self.id = id
        self.date = date
        self.dailyGoal = dailyGoal
        self.meals = meals
    }

    var totalMacros: MacroNutrients {
        meals.reduce(.zero) { $0 + $1.totalMacros }
    }
}
