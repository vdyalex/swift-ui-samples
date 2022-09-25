import SwiftUI

struct Checkbox: View {
  @Binding<Bool> var checked: Bool

  var body: some View {
    Button(action: onToggle) {
      ZStack {
        RoundedRectangle(cornerRadius: 3)
          .stroke(Color("checkbox.border"), lineWidth: 1)
          .background(Color("checkbox.background"))
          .frame(width: 20, height: 20)

        if checked {
          Image(systemName: "checkmark")
            .frame(width: 20, height: 20)
            .font(.system(size: 10).bold())
            .foregroundColor(Color("checkbox.foreground"))
            .transition(.opacity)
        }
      }
    }
  }

  func onToggle() {
    checked.toggle()
  }
}

struct Checkbox_Previews: PreviewProvider {
  static var previews: some View {
    Checkbox(checked: .constant(true))
  }
}
