import SwiftUI

private struct ButtonBorder: View {
  var body: some View {
    Capsule()
      .stroke(Color("ButtonPrimaryBorder"), lineWidth: 1)
  }
}

private struct ButtonBackground: View {
  var body: some View {
    Capsule()
      .foregroundColor(Color("ButtonPrimaryBackground"))
  }
}

struct ButtonPrimary: View {
  var label: String
  var onPress: () -> Void

  var body: some View {
    Button(action: onPress) {
      Text(LocalizedStringKey(label))
        .font(.system(size: 16).bold())
        .padding(.all, 16)
        .padding(.horizontal, 18)
        .foregroundColor(Color("ButtonPrimaryLabel"))
        .frame(maxWidth: .infinity)
        .overlay(ButtonBorder())
        .background(ButtonBackground())
    }
  }
}

struct ButtonPrimary_Previews: PreviewProvider {
  static var previews: some View {
    ButtonPrimary(label: "My button") {}
  }
}
