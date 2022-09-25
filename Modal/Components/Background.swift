import SwiftUI

private let BACKGROUND: [Color] = [
  Color("BackgroundAccentTop"),
  Color("BackgroundAccentBottom"),
]

struct Background: View {
  var body: some View {
    LinearGradient(
      colors: BACKGROUND,
      startPoint: .top,
      endPoint: .center
    )
    .edgesIgnoringSafeArea(.all)
  }
}

struct Background_Previews: PreviewProvider {
  static var previews: some View {
    Background()
  }
}
