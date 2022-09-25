import SwiftUI

struct ButtonOutline: View {
  var label: String
  var onPress: () -> Void

  var background: some View {
    RoundedRectangle(cornerRadius: 100)
      .stroke(Color("button.secondary.border"), lineWidth: 1)
      .foregroundColor(Color("button.secondary.background"))
  }

  var body: some View {
    Button(action: onPress) {
      Text(label)
        .font(.system(size: 16).bold())
        .padding(.vertical, 12)
        .foregroundColor(Color("button.secondary.label"))
        .frame(maxWidth: .infinity)
        .background(background)
    }
  }
}

struct ButtonOutline_Previews: PreviewProvider {
    static var previews: some View {
      ButtonOutline(label: "Example") {}
    }
}
