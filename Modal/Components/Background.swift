import SwiftUI

enum BackgroundStyle {
  case gradient
  case solid
}

private struct GradientBackground: View {
  let colors: [Color] = [
    Color("BackgroundGradientTop"),
    Color("BackgroundGradientBottom"),
  ]

  var body: some View {
    LinearGradient(
      colors: colors,
      startPoint: .top,
      endPoint: .center
    )
    .edgesIgnoringSafeArea(.all)
  }
}

private struct SolidBackground: View {
  var body: some View {
    Color("BackgroundPrimary")
      .edgesIgnoringSafeArea(.all)
  }
}

struct Background<Content>: View where Content: View {
  var style: BackgroundStyle = .solid
  @ViewBuilder var content: () -> Content

  init(_ style: BackgroundStyle = .solid, content: @escaping () -> Content) {
    self.style = style
    self.content = content
  }

  var body: some View {
    ZStack {
      switch style {
        case .gradient: GradientBackground()
        case .solid: SolidBackground()
      }

      content()
    }
  }
}

struct Background_Previews: PreviewProvider {
  static var previews: some View {
    Background(.solid) {
      Text(verbatim: "Content")
    }
  }
}
