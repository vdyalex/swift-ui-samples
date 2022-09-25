import SwiftUI

fileprivate struct Header: View {
  var onDismiss: () -> Void

  var body: some View {
    HStack {
      Text("Ping inactive users")
        .foregroundColor(Color("title.primary"))
        .font(.system(size: 28).bold())

      Spacer()

      Button(action: onDismiss) {
        Image(systemName: "xmark")
          .foregroundColor(Color("icon.dismiss"))
          .font(.system(size: 24))
      }
    }
    .padding(.vertical, 1)

    Text("4 friends")
      .foregroundColor(Color("subtitle.primary"))
      .padding(.vertical, 1)
  }
}

fileprivate struct Actions: View {
  let columns = [
    GridItem(.flexible(minimum: 30), spacing: 12),
    GridItem(.flexible(minimum: 30), spacing: 12),
  ]

  var onSelect: () -> Void
  var onDeselect: () -> Void

  var body: some View {
    LazyVGrid(columns: columns) {
      ButtonOutline(label: "Select all", onPress: onSelect)
      ButtonOutline(label: "Deselect all", onPress: onDeselect)
    }
    .padding(.vertical, 20)
  }
}

struct OverlayModal: View {
  @Environment(\.presentationMode) var presentation
  @State var displayAlert = false

  var users: [UserModel] = []

  var body: some View {
    ZStack {
      Color("background.primary")
        .edgesIgnoringSafeArea(.all)

      VStack(alignment: .leading) {
        Header(onDismiss: onDismiss)

        Actions(onSelect: {}, onDeselect: {})

        ScrollView(showsIndicators: true) {
          VStack(alignment: .leading, spacing: 8) {
            ForEach(users) { user in
              Card(name: user.name, email: user.email, image: user.image)
            }
          }
          .frame(maxWidth: .infinity)
          .padding(.all, 16)
        }
        .background(Color("background.secondary").cornerRadius(8))
        .padding(.bottom, 16)
        .frame(maxHeight: .infinity)

        ButtonWide(label: "Ping selected friends") {
          displayAlert.toggle()
        }
      }
      .padding(.horizontal, 24)
      .padding(.top, 16)
    }.alert("", isPresented: $displayAlert, actions: {
      Button("Cancel", role: .cancel, action: onDismiss)
    }, message: {
      Text("Your friends will received a notification soon.")
    })
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
