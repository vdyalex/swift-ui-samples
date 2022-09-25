import SwiftUI

private let GRID_COLUMNS: [GridItem] = [
  GridItem(.fixed(20), spacing: 8),
  GridItem(.fixed(56), spacing: 8),
  GridItem(.flexible(minimum: 0), spacing: 8),
]

private let CARD_SELECTED_OPACITY: Double = 0.5
private let CARD_UNSELECTED_OPACITY: Double = 1.0

struct Card: View {
  var name: String
  var email: String
  var image: String

  @State var checked: Bool = false
  @State var opacity: Double = CARD_UNSELECTED_OPACITY

  var body: some View {
    Button(action: onPress) {
      LazyVGrid(columns: GRID_COLUMNS) {
        Checkbox(checked: $checked)
        Headshot(image).opacity(opacity)
        UserInfo(name: name, email: email).opacity(opacity)
      }
      .frame(maxWidth: .infinity, minHeight: 72)
      .padding(.all, 8)
      .padding(.horizontal, 8)
      .background(Color("CardBackground").opacity(opacity))
      .cornerRadius(8)
      .shadow(color: Color("DropShadow"), radius: 16, y: 4)
    }
  }

  func onPress() {
    withAnimation {
      checked.toggle()
      opacity = checked
      ? CARD_SELECTED_OPACITY
      : CARD_UNSELECTED_OPACITY
    }
  }
}

struct Card_Previews: PreviewProvider {
  static var previews: some View {
    Card(name: "John Doe", email: "john.doe@live.com", image: "user01")
  }
}
