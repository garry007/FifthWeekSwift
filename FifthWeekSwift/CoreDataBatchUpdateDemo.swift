import SwiftUI
import CoreData

struct CoreDataBatchUpdateDemo: View {
    @Environment(\.managedObjectContext) private var ctx
    @State private var count: Int = 0

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button("Seed 1,000 Tasks") { seed(1000) }
                Button("Clear All") { clearAll() }
            }
            .buttonStyle(.bordered)

            Button("Batch Mark as Done (NSBatchUpdateRequest)") { batchMarkDone() }
                .buttonStyle(.borderedProminent)

            Text("Current tasks: \(count)")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("CoreData Batch Update")
        .onAppear { refreshCount() }
    }

    private func seed(_ n: Int) {
        for i in 0..<n {
            let t = TaskItem(context: ctx)
            t.id = UUID(); t.title = "Task #\(i)"; t.isDone = false
        }
        try? ctx.save(); refreshCount()
    }

    private func clearAll() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskItem")
        let delete = NSBatchDeleteRequest(fetchRequest: fetch)
        _ = try? ctx.execute(delete)
        try? ctx.save(); refreshCount()
    }

    private func batchMarkDone() {
        let request = NSBatchUpdateRequest(entityName: "TaskItem")
        request.resultType = .updatedObjectsCountResultType
        request.propertiesToUpdate = ["isDone": true]
        if let result = try? ctx.execute(request) as? NSBatchUpdateResult {
            print("Updated objects count: \(result.result as? Int ?? 0)")
        }
        // Refresh context to reflect external batch updates
        ctx.refreshAllObjects()
        refreshCount()
    }

    private func refreshCount() {
        let fetch: NSFetchRequest<TaskItem> = NSFetchRequest(entityName: "TaskItem")
        if let items = try? ctx.fetch(fetch) { count = items.count }
    }
}
