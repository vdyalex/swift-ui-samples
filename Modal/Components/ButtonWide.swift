import SwiftUI

struct ButtonWide: View {
  var label: String
  var onPress: () -> Void

  var background: some View {
    Capsule()
      .foregroundColor(Color("button.primary.foreground"))
  }

  var body: some View {
    Button(action: onPress) {
      Text(label)
        .font(.system(size: 16).bold())
        .padding(.all, 16)
        .padding(.horizontal, 18)
        .foregroundColor(Color("button.primary.label"))
        .frame(maxWidth: .infinity)
        .background(background)
    }
  }
}

struct ButtonWide_Previews: PreviewProvider {
  static var previews: some View {
    ButtonWide(label: "My button") {}
  }
}
