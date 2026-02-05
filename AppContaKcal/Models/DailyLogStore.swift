import Foundation
import SwiftUI

final class DailyLogStore: ObservableObject {
    @Published var dayLog: DayLog
    @Published var recipes: [Recipe]

    init() {
        let defaultGoal = MacroNutrients(calories: 2000, protein: 130, carbs: 230, fats: 70)
        self.dayLog = DayLog(
            dailyGoal: defaultGoal,
            meals: [
                Meal(name: "Colazione"),
                Meal(name: "Pranzo"),
                Meal(name: "Cena"),
                Meal(name: "Spuntini")
            ]
        )
        self.recipes = [
            Recipe(
                name: "Pasta proteica",
                servings: 2,
                ingredients: [
                    FoodItem(name: "Pasta integrale", servingDescription: "100 g", macros: MacroNutrients(calories: 350, protein: 12, carbs: 70, fats: 2)),
                    FoodItem(name: "Petto di pollo", servingDescription: "120 g", macros: MacroNutrients(calories: 198, protein: 37, carbs: 0, fats: 4))
                ]
            )
        ]
    }

    func addMeal(named name: String) {
        dayLog.meals.append(Meal(name: name))
    }

    func addFood(_ food: FoodItem, to meal: Meal) {
        guard let index = dayLog.meals.firstIndex(where: { $0.id == meal.id }) else { return }
        dayLog.meals[index].foods.append(food)
    }

    func addRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
    }

    func updateDailyGoal(_ goal: MacroNutrients) {
        dayLog.dailyGoal = goal
    }
}
