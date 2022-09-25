import Foundation

class UserModel: Codable, Identifiable {
  enum CodingKeys: CodingKey {
    case name
    case email
    case image
  }

  var name: String
  var email: String
  var image: String

  init(name: String, email: String, image: String) {
    self.name = name
    self.email = email
    self.image = image
  }

  static func load() -> [UserModel] {
    guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
      return []
    }

    let data = try! Data(contentsOf: url)
    let users = try! JSONDecoder().decode([UserModel].self, from: data)
    return users
  }
}
