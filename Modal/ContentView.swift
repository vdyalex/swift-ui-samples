import SwiftUI

struct ContentView: View {
  @State var isOpen = false
  let users: [UserModel] = UserModel.load()

  var body: some View {
    ZStack {
      Background()

      VStack {
        Spacer()
        Logo()
        Title("HOME_SCREEN_TITLE")
        Spacer()
        ButtonPrimary(label: "HOME_SCREEN_ACTION_PING", onPress: onOpen)
      }
      .padding(.all, 20)
    }
    .fullScreenCover(isPresented: $isOpen) {
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
