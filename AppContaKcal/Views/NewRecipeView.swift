import SwiftUI

struct NewRecipeView: View {
    @EnvironmentObject var store: DailyLogStore
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var servings = ""
    @State private var ingredientName = ""
    @State private var ingredientCalories = ""
    @State private var ingredientProtein = ""
    @State private var ingredientCarbs = ""
    @State private var ingredientFats = ""
    @State private var ingredients: [FoodItem] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Dettagli ricetta")) {
                    TextField("Nome ricetta", text: $name)
                    TextField("Numero porzioni", text: $servings)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Ingredienti")) {
                    TextField("Nome ingrediente", text: $ingredientName)
                    TextField("Calorie", text: $ingredientCalories)
                        .keyboardType(.numberPad)
                    TextField("Proteine (g)", text: $ingredientProtein)
                        .keyboardType(.decimalPad)
                    TextField("Carboidrati (g)", text: $ingredientCarbs)
                        .keyboardType(.decimalPad)
                    TextField("Grassi (g)", text: $ingredientFats)
                        .keyboardType(.decimalPad)

                    Button("Aggiungi ingrediente") {
                        let macros = MacroNutrients(
                            calories: Int(ingredientCalories) ?? 0,
                            protein: Double(ingredientProtein) ?? 0,
                            carbs: Double(ingredientCarbs) ?? 0,
                            fats: Double(ingredientFats) ?? 0
                        )
                        let item = FoodItem(name: ingredientName, servingDescription: "Ingrediente", macros: macros)
                        ingredients.append(item)
                        clearIngredientFields()
                    }

                    ForEach(ingredients) { ingredient in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(ingredient.name)
                                Text("\(ingredient.macros.calories) kcal")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Nuova ricetta")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salva") {
                        let recipe = Recipe(
                            name: name,
                            servings: Int(servings) ?? 1,
                            ingredients: ingredients
                        )
                        store.addRecipe(recipe)
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

    private func clearIngredientFields() {
        ingredientName = ""
        ingredientCalories = ""
        ingredientProtein = ""
        ingredientCarbs = ""
        ingredientFats = ""
    }
}
