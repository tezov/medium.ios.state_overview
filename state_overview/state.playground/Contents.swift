import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    @State var counter1 = 0
    @State var counter2: Int
    @State var counter3 = 0
    @State var counter4 = 0

    init(initialValue: Int = 0) {
        self._counter2 = State(wrappedValue: initialValue)
    }

    var body: some View {
        VStack {
            Text("Counter1 \(counter1)      ")
            Text("Counter2 \(counter2)      ")
            SubView1($counter3)
            SubView2(counter4: $counter4)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                counter1 += 1
            }
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                counter2 += 1
            }
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                counter4 += 1
            }
        }
    }
}

struct SubView1: View {
    @Binding var counter3: Int

    init(_ counter3: Binding<Int>) {
        self._counter3 = counter3
    }

    var body: some View {
        Text("never updated but update counter3 through binding")
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                    counter3 += 1
                }
            }
    }
}

struct SubView2: View {
    @Binding var counter4: Int

    var body: some View {
        Text("redrawn through binding counter4 \(counter4)      ")
    }
}

PlaygroundPage.current.setLiveView(ContentView(initialValue: 0))
