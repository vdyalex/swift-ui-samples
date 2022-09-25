import SwiftUI

struct Title: View {
  var title: String

  init(_ title: String) {
    self.title = title
  }

  var body: some View {
    Text(LocalizedStringKey(title))
      .font(.system(size: 40).bold())
      .foregroundColor(Color("TitlePrimary"))
  }
}

struct Title_Previews: PreviewProvider {
  static var previews: some View {
    Title("ACME")
  }
}
