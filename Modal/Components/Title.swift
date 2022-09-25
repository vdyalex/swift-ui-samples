import SwiftUI

struct Title: View {
  var title: LocalizedStringKey

  init(_ title: LocalizedStringKey) {
    self.title = title
  }

  var body: some View {
    Text(title)
      .font(.system(size: 40).bold())
      .foregroundColor(Color("TitlePrimary"))
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    Title("ACME")
  }
}
