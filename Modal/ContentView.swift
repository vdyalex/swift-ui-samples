import SwiftUI

struct ContentView: View {
  let colors: [Color] = [
    Color("background.accent.top"),
    Color("background.accent.bottom"),
  ]
  @State var isOpen = false
  let users: [UserModel] = UserModel.load()

  var background: some View {
    LinearGradient(
      colors: colors,
      startPoint: .top,
      endPoint: .center
    )
    .edgesIgnoringSafeArea(.bottom)
  }

  var title: some View {
    Text("Drop Inc.")
      .font(.system(size: 40).bold())
      .foregroundColor(Color("title.primary"))
  }

  var body: some View {
    ZStack {
      background

      VStack {
        Spacer()
        title
        Spacer()
        ButtonWide(label: "Ping Friends", onPress: onOpen)
      }
      .padding(.all, 20)
    }
    .sheet(isPresented: $isOpen) {
      OverlayModal(users: users)
    }
  }

  func onOpen() {
    isOpen = true
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
