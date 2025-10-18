import SwiftUI

struct DraggableItem: Identifiable, Equatable { let id = UUID(); var title: String }

struct GesturesDemo: View {
    @State private var items: [DraggableItem] = ["Apple", "Banana", "Cherry"].map { DraggableItem(title: $0) }
    @State private var dropZone: [DraggableItem] = []

    var body: some View {
        VStack {
            Text("Drag items into the drop zone")
                .font(.headline)
            List {
                ForEach(items) { item in
                    Text(item.title)
                        .draggable(item.title)
                }
            }
            .frame(height: 200)

            DropArea(dropZone: $dropZone)
                .frame(height: 160)

            Text("Dropped: \(dropZone.map { $0.title }.joined(separator: ", "))")
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Gestures: Drag & Drop")
    }
}

private struct DropArea: View {
    @Binding var dropZone: [DraggableItem]

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
            .overlay(Text("Drop Here").foregroundStyle(.secondary))
            .onDrop(of: [.text], isTargeted: nil) { providers in
                for p in providers {
                    _ = p.loadObject(ofClass: String.self) { str, _ in
                        if let s = str { DispatchQueue.main.async { dropZone.append(DraggableItem(title: s)) } }
                    }
                }
                return true
            }
    }
}
