import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    private init() {
        let model = NSManagedObjectModel()
        let entity = NSEntityDescription()
        entity.name = "TaskItem"
        entity.managedObjectClassName = String(describing: TaskItem.self)

        let id = NSAttributeDescription(); id.name = "id"; id.attributeType = .UUIDAttributeType; id.isOptional = false
        let title = NSAttributeDescription(); title.name = "title"; title.attributeType = .stringAttributeType; title.isOptional = false
        let done = NSAttributeDescription(); done.name = "isDone"; done.attributeType = .booleanAttributeType; done.isOptional = false

        entity.properties = [id, title, done]
        model.entities = [entity]

        container = NSPersistentContainer(name: "Week5Model", managedObjectModel: model)
        container.loadPersistentStores { _, error in
            if let error = error { fatalError("CoreData load error: \(error)") }
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

@objc(TaskItem)
class TaskItem: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var title: String
    @NSManaged var isDone: Bool
}
