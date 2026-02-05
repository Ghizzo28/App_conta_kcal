import Foundation

struct FoodItem: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var servingDescription: String
    var macros: MacroNutrients

    init(id: UUID = UUID(), name: String, servingDescription: String, macros: MacroNutrients) {
        self.id = id
        self.name = name
        self.servingDescription = servingDescription
        self.macros = macros
    }
}
