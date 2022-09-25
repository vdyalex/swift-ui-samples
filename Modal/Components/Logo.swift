import SwiftUI

struct Logo: View {
  var body: some View {
    Image("Logo")
      .resizable()
      .scaledToFit()
      .frame(width: 200, height: 200)
      .cornerRadius(12)
  }
}

struct Logo_Previews: PreviewProvider {
  static var previews: some View {
    Logo()
  }
}
