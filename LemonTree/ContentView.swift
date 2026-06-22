import SwiftUI

struct ContentView: View {
    @State private var itemCount = 0
    @State private var items: [String] = []

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack(spacing: 16) {
                    Image(systemName: "swift")
                        .font(.system(size: 60))
                        .foregroundStyle(.orange)
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundStyle(.secondary)
                    Image(systemName: "gearshape.2.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.blue)
                }
                .padding(.top, 40)

                Text("LemonTree")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("iOS CI/CD Ready")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Divider()
                    .padding(.horizontal, 60)

                VStack(spacing: 16) {
                    Text("Items: \(itemCount)")
                        .font(.headline)
                        .contentTransition(.numericText())

                    Button {
                        withAnimation(.spring(response: 0.3)) {
                            itemCount += 1
                            items.insert("Item #\(itemCount)", at: 0)
                        }
                    } label: {
                        Label("Add Item", systemImage: "plus.circle.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    if !items.isEmpty {
                        List {
                            ForEach(items, id: \.self) { item in
                                HStack {
                                    Text(item)
                                        .transition(.slide)
                                    Spacer()
                                    Image(systemName: "checkmark.circle")
                                        .foregroundStyle(.green)
                                }
                            }
                            .onDelete { offsets in
                                withAnimation {
                                    items.remove(atOffsets: offsets)
                                    itemCount = items.count
                                }
                            }
                        }
                        .listStyle(.insetGrouped)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal)

                Spacer()

                Text("Built with GitHub Actions CI/CD")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                    .padding(.bottom, 8)
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
