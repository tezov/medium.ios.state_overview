import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                Text("Internal")
                sectionOne
                sectionTwo
            }
            Group {
                Text("External")
                    .padding(.top, 10)
                SubViewOne()
                SubViewTwo(param: 17)
            }
            Group {
                Text("Class could be a StateObject")
                    .padding(.top, 10)
                ViewProvider().body {
                    Text("extra content")
                }
            }
        }
    }

    var sectionOne: some View {
        VStack {
            Text("section one - a")
            Text("section one - b")
        }
    }

    @ViewBuilder
    var sectionTwo: some View {
        Text("section two - a")
        Text("section two - b")
    }
}

struct SubViewOne: View {
    var body: some View {
        VStack {
            Text("Subview one")
        }
    }
}

struct SubViewTwo: View {
    var param: Int

    var body: some View {
        VStack {
            Text("Subview two \(param)")
        }
    }
}

class ViewProvider {
    func body<Content: View>(@ViewBuilder extraContent: @escaping () -> Content) -> some View {
        return VStack {
            Text("From Class")
            extraContent()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
