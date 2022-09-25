import SwiftUI

struct NavigationHeader: View {
  var title: LocalizedStringKey
  var onDismiss: () -> Void = {}
  var spacing: CGFloat = 0

  init(_ title: LocalizedStringKey, spacing: CGFloat = 0, onDismiss: @escaping () -> Void = {}) {
    self.title = title
    self.spacing = spacing
    self.onDismiss = onDismiss
  }

  var body: some View {
    HStack(alignment: .top) {
      Text(title)
        .foregroundColor(Color("TitlePrimary"))
        .font(.system(size: 28).bold())

      Spacer()

      Button(action: onDismiss) {
        Image(systemName: "xmark")
          .foregroundColor(Color("IconDismissForeground"))
          .font(.system(size: 24))
      }
    }
    .padding(.horizontal, spacing)
    .padding(.top, 16)
    .padding(.bottom, 0)
  }
}

struct NavigationHeader_Previews: PreviewProvider {
  static var previews: some View {
    NavigationHeader("My Screen") {}
  }
}
