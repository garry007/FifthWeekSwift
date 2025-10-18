import SwiftUI

struct FeatureListView: View {
    var body: some View {
        NavigationStack {
            List(Feature.allCases) { feature in
                NavigationLink(feature.title) {
                    feature.destination
                }
            }
            .navigationTitle("Week 5 Demos")
        }
    }
}
