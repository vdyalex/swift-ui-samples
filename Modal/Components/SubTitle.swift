import SwiftUI

struct SubTitle: View {
  var subtitle: LocalizedStringKey

  init(_ subtitle: LocalizedStringKey) {
    self.subtitle = subtitle
  }

  var body: some View {
    Text(subtitle)
      .foregroundColor(Color("SubtitlePrimary"))
      .padding(.vertical, 0)
  }
}

struct SubTitle_Previews: PreviewProvider {
  static var previews: some View {
    SubTitle("PING_SCREEN_SUBTITLE \(3)")
  }
}
