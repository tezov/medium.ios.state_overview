import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                SubViewOne {
                    Text("subView content one")
                        .padding(.bottom, 5)
                }
                SubViewTwo {
                    Text("subView content two")
                        .padding(.bottom, 5)
                }
                SubViewThree {
                    Text("subView content three")
                        .padding(.bottom, 5)
                }
            }
        }
    }
}

struct SubViewOne<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack {
            Text("Subview one")
            content
        }
    }
}

struct SubViewTwo<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        // Better to do it the same way of SubViewThree.
        //Still I let this example here for information
    }

    var body: some View {
        VStack {
            Text("Subview two")
            content
        }
    }
}

struct SubViewThree<Content: View>: View {
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack {
            Text("Subview three")
            content()
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
