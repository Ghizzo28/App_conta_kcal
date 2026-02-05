import SwiftUI

struct GoalSummaryView: View {
    @EnvironmentObject var store: DailyLogStore

    var body: some View {
        let total = store.dayLog.totalMacros
        let goal = store.dayLog.dailyGoal

        VStack(alignment: .leading, spacing: 12) {
            Text("Obiettivo giornaliero")
                .font(.headline)
            ProgressView(value: Double(total.calories), total: Double(goal.calories))
            HStack {
                Text("Assunte: \(total.calories) kcal")
                Spacer()
                Text("Target: \(goal.calories) kcal")
                    .foregroundColor(.secondary)
            }
            MacroRow(macros: total, label: "Macro assunti")
            MacroRow(macros: goal, label: "Macro target")
        }
        .padding(.vertical, 4)
    }
}
