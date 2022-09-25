import SwiftUI

struct UserInfo: View {
  var name: String
  var email: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(verbatim: name)
        .font(.system(size: 18).bold())
        .foregroundColor(Color("CardTitle"))
        .frame(maxWidth: .infinity, alignment: .leading)

      Text(verbatim: email)
        .font(.system(size: 12))
        .foregroundColor(Color("CardSubtitle"))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(maxWidth: .infinity)
    .padding(.all, 4)
  }
}

struct UserInfo_Previews: PreviewProvider {
  static var previews: some View {
    UserInfo(name: "John Doe", email: "john.doe@gmail.com")
  }
}
