import SwiftUI

private struct Header: View {
  var totalFriends: Int
  var onDismiss: () -> Void

  var body: some View {
    HStack(alignment: .top) {
      Text("PING_SCREEN_TITLE")
        .foregroundColor(Color("TitlePrimary"))
        .font(.system(size: 28).bold())

      Spacer()

      Button(action: onDismiss) {
        Image(systemName: "xmark")
          .foregroundColor(Color("IconDismissForeground"))
          .font(.system(size: 24))
      }
    }
    .padding(.vertical, 1)

    Text("PING_SCREEN_SUBTITLE \(totalFriends)")
      .foregroundColor(Color("SubtitlePrimary"))
      .padding(.vertical, 1)
  }
}

private struct Actions: View {
  let columns = [
    GridItem(.flexible(minimum: 30), spacing: 12),
    GridItem(.flexible(minimum: 30), spacing: 12),
  ]

  var onSelect: () -> Void
  var onUnselect: () -> Void

  var body: some View {
    LazyVGrid(columns: columns) {
      ButtonSecondary(label: "PING_SCREEN_ACTION_SELECT_ALL", onPress: onSelect)
      ButtonSecondary(label: "PING_SCREEN_ACTION_UNSELECT_ALL", onPress: onUnselect)
    }
    .padding(.vertical, 20)
  }
}

private struct Content: View {
  var users: [UserModel] = []

  var body: some View {
    ScrollView(showsIndicators: true) {
      VStack(alignment: .leading, spacing: 8) {
        ForEach(users) { user in
          Card(name: user.name, email: user.email, image: user.image)
        }
      }
      .frame(maxWidth: .infinity)
      .padding(.all, 16)
    }
    .background(Color("BackgroundSecondary").cornerRadius(8))
    .padding(.bottom, 16)
    .frame(maxHeight: .infinity)
  }
}

struct OverlayModal: View {
  @Environment(\.presentationMode) var presentation
  @State var displayAlert: Bool = false
  var users: [UserModel] = []

  var body: some View {
    ZStack {
      Color("BackgroundPrimary")
        .edgesIgnoringSafeArea(.all)

      VStack(alignment: .leading) {
        Header(totalFriends: users.count, onDismiss: onDismiss)
        Actions(onSelect: {}, onUnselect: {})
        Content(users: users)
        ButtonPrimary(label: "PING_SCREEN_ACTION_PING", onPress: onPing)
      }
      .padding(.horizontal, 24)
      .padding(.top, 16)
    }.alert("PING_SCREEN_MESSAGE_TITLE", isPresented: $displayAlert, actions: {
      Button("PING_SCREEN_MESSAGE_DISMISS", action: onDismiss)
    }, message: {
      Text("PING_SCREEN_MESSAGE_SUCCESS")
    })
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
