import SwiftUI

let COLUMNS: [GridItem] = [
  GridItem(.fixed(20), spacing: 8),
  GridItem(.fixed(56), spacing: 8),
  GridItem(.flexible(minimum: 0), spacing: 8),
]

struct Card: View {
  var name: String
  var email: String
  var image: String

  @State var checked: Bool = false
  @State var opacity: Double = 1.0

  var headshot: some View {
    Image(image)
      .resizable()
      .scaledToFill()
      .frame(width: 56, height: 56)
      .background(Color("card.image"))
      .cornerRadius(28)
  }

  var user: some View {
    VStack(alignment: .leading) {
      Text(name)
        .font(.system(size: 18).bold())
        .foregroundColor(Color("card.title"))
        .frame(maxWidth: .infinity, alignment: .leading)

      Text(email)
        .font(.system(size: 12))
        .foregroundColor(Color("card.subtitle"))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(maxWidth: .infinity)
    .padding(.all, 4)
  }

  var body: some View {
    Button(action: onPress) {
      LazyVGrid(columns: COLUMNS) {
        Checkbox(checked: $checked)
        headshot.opacity(opacity)
        user.opacity(opacity)
      }
      .frame(maxWidth: .infinity, minHeight: 72)
      .padding(.all, 8)
      .padding(.horizontal, 8)
      .background(Color("card.background").opacity(opacity))
      .cornerRadius(8)
      .shadow(color: Color("shadow"), radius: 16, y: 4)
    }
  }

  func onPress() {
    checked.toggle()
    opacity = checked ? 0.4 : 1.0
  }
}

struct Card_Previews: PreviewProvider {
  static var previews: some View {
    Card(name: "John Doe", email: "john.doe@live.com", image: "user01")
  }
}
