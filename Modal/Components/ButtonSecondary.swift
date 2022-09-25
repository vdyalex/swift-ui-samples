import SwiftUI

private struct ButtonBorder: View {
  var body: some View {
    Capsule()
      .stroke(Color("ButtonSecondaryBorder"), lineWidth: 1)
  }
}

private struct ButtonBackground: View {
  var body: some View {
    Capsule()
      .foregroundColor(Color("ButtonSecondaryBackground"))
  }
}

struct ButtonSecondary: View {
  var label: LocalizedStringKey
  var onPress: () -> Void

  init(_ label: LocalizedStringKey, onPress: @escaping () -> Void = {}) {
    self.label = label
    self.onPress = onPress
  }

  var body: some View {
    Button(action: onPress) {
      Text(label)
        .font(.system(size: 16).bold())
        .padding(.vertical, 12)
        .foregroundColor(Color("ButtonSecondaryLabel"))
        .frame(maxWidth: .infinity)
        .overlay(ButtonBorder())
        .background(ButtonBackground())
    }
  }
}

struct ButtonSecondary_Previews: PreviewProvider {
  static var previews: some View {
    ButtonSecondary("My Button")
  }
}
