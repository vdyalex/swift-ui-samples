import SwiftUI

struct ScrollList<Content>: View where Content: View {
  @ViewBuilder var content: () -> Content

  var body: some View {
    ScrollView(showsIndicators: true) {
      VStack(alignment: .leading, spacing: 8, content: content)
        .frame(maxWidth: .infinity)
        .padding(.all, 16)
    }
    .background(Color("BackgroundSecondary").cornerRadius(8))
    .padding(.bottom, 16)
    .frame(maxHeight: .infinity)
  }
}

struct ItemList_Previews: PreviewProvider {
  static var previews: some View {
    ScrollList {
      Text(verbatim: "Content")
    }
  }
}
