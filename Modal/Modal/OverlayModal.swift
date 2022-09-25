import SwiftUI

private struct Actions: View {
  let columns = [
    GridItem(.flexible(minimum: 30), spacing: 12),
    GridItem(.flexible(minimum: 30), spacing: 12),
  ]

  var onSelect: () -> Void = {}
  var onUnselect: () -> Void = {}

  var body: some View {
    LazyVGrid(columns: columns) {
      ButtonSecondary("PING_SCREEN_ACTION_SELECT_ALL", onPress: onSelect)
      ButtonSecondary("PING_SCREEN_ACTION_UNSELECT_ALL", onPress: onUnselect)
    }
    .padding(.vertical, 20)
  }
}

struct OverlayModal: View {
  @Environment(\.presentationMode) var presentation
  @State var displayAlert: Bool = false
  var users: [UserModel] = []

  var body: some View {
    Background {
      VStack(alignment: .leading) {
        NavigationHeader("PING_SCREEN_TITLE", onDismiss: onDismiss)
        SubTitle("PING_SCREEN_SUBTITLE \(users.count)")

        Actions()

        ItemList {
          ForEach(users) { user in
            Card(name: user.name, email: user.email, image: user.image)
          }
        }

        ButtonPrimary("PING_SCREEN_ACTION_PING", onPress: onPing)
      }
      .padding(.horizontal, 24)
    }
    .alert(
      "PING_SCREEN_MESSAGE_TITLE",
      isPresented: $displayAlert,
      actions: {
        Button("PING_SCREEN_MESSAGE_DISMISS", action: onDismiss)
      },
      message: {
        Text("PING_SCREEN_MESSAGE_SUCCESS")
      }
    )
  }

  func onPing() {
    displayAlert.toggle()
  }

  func onDismiss() {
    presentation.wrappedValue.dismiss()
  }
}

struct OverlayModal_Previews: PreviewProvider {
  static var previews: some View {
    OverlayModal(users: UserModel.load())
  }
}
