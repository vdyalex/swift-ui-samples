import SwiftUI

struct Headshot: View {
  var image: String

  init(_ image: String) {
    self.image = image
  }

  var body: some View {
    Image(image)
      .resizable()
      .scaledToFill()
      .frame(width: 56, height: 56)
      .background(Color("CardImage"))
      .cornerRadius(28)
  }
}

struct Headshot_Previews: PreviewProvider {
  static var previews: some View {
    Headshot("user01")
  }
}
