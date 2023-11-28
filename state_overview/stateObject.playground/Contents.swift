import PlaygroundSupport
import SwiftUI

class Counter: ObservableObject {
    @Published private(set) var value:Int

    init(_ value: Int = 0) {
        self.value = value
    }

    func start(delay: Double) {
        Timer.scheduledTimer(withTimeInterval: delay, repeats: true) { [weak self] _ in
            self?.value += 1
        }
    }
}

struct ContentView: View {
    @StateObject var counter1 = Counter()
    @StateObject var counter2: Counter
    @StateObject var counter3 = Counter()
    @StateObject var counter4 = Counter()

    init(initialValue: Int = 0) {
        self._counter2 = StateObject(wrappedValue: Counter(initialValue))
    }

    var body: some View {
        VStack {
            Text("Counter1 \(counter1.value)      ")
            Text("Counter2 \(counter2.value)      ")
            SubView1(counter3)
            SubView2(counter4: counter4)
        }
        .onAppear {
            counter1.start(delay: 1)
            counter2.start(delay: 2)
            counter4.start(delay: 4)
        }
    }
}

struct SubView1: View {
    @ObservedObject var counter3: Counter

    init(_ counter3: Counter) {
        self._counter3 = ObservedObject(wrappedValue: counter3)
    }

    var body: some View {
        Text("never updated but update counter3 through binding")
            .onAppear {
                counter3.start(delay: 3)
            }
    }
}

struct SubView2: View {
    @ObservedObject var counter4: Counter

    var body: some View {
        Text("redrawn through binding counter4 \(counter4.value)      ")
    }
}

PlaygroundPage.current.setLiveView(ContentView(initialValue: 0))
