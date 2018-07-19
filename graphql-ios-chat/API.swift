//  This file was automatically generated and should not be edited.

import Apollo

public final class AddMessageMutationMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddMessageMutation($from: String!, $to: String!, $text: String!) {\n  addMessage(from: $from, to: $to, text: $text) {\n    __typename\n    id\n    text\n  }\n}"

  public var from: String
  public var to: String
  public var text: String

  public init(from: String, to: String, text: String) {
    self.from = from
    self.to = to
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["from": from, "to": to, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMessage", arguments: ["from": GraphQLVariable("from"), "to": GraphQLVariable("to"), "text": GraphQLVariable("text")], type: .object(AddMessage.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addMessage: AddMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addMessage": addMessage.flatMap { (value: AddMessage) -> ResultMap in value.resultMap }])
    }

    public var addMessage: AddMessage? {
      get {
        return (resultMap["addMessage"] as? ResultMap).flatMap { AddMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addMessage")
      }
    }

    public struct AddMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, text: String) {
        self.init(unsafeResultMap: ["__typename": "Message", "id": id, "text": text])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var text: String {
        get {
          return resultMap["text"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "text")
        }
      }
    }
  }
}

public final class NewMessageSubscriptionSubscription: GraphQLSubscription {
  public let operationDefinition =
    "subscription NewMessageSubscription($userId1: String!, $userId2: String!) {\n  newMessage(from: $userId1, to: $userId2) {\n    __typename\n    text\n    from {\n      __typename\n      id\n    }\n  }\n}"

  public var userId1: String
  public var userId2: String

  public init(userId1: String, userId2: String) {
    self.userId1 = userId1
    self.userId2 = userId2
  }

  public var variables: GraphQLMap? {
    return ["userId1": userId1, "userId2": userId2]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("newMessage", arguments: ["from": GraphQLVariable("userId1"), "to": GraphQLVariable("userId2")], type: .object(NewMessage.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newMessage: NewMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "newMessage": newMessage.flatMap { (value: NewMessage) -> ResultMap in value.resultMap }])
    }

    public var newMessage: NewMessage? {
      get {
        return (resultMap["newMessage"] as? ResultMap).flatMap { NewMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "newMessage")
      }
    }

    public struct NewMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
        GraphQLField("from", type: .nonNull(.object(From.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(text: String, from: From) {
        self.init(unsafeResultMap: ["__typename": "Message", "text": text, "from": from.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var text: String {
        get {
          return resultMap["text"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "text")
        }
      }

      public var from: From {
        get {
          return From(unsafeResultMap: resultMap["from"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "from")
        }
      }

      public struct From: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class UsersQueryQuery: GraphQLQuery {
  public let operationDefinition =
    "query UsersQuery {\n  users {\n    __typename\n    id\n    name\n    email\n    address\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .list(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: [User?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "users": users.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }])
    }

    public var users: [User?]? {
      get {
        return (resultMap["users"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [User?] in value.map { (value: ResultMap?) -> User? in value.flatMap { (value: ResultMap) -> User in User(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("address", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, name: String? = nil, email: String? = nil, address: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "address": address])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var address: String? {
        get {
          return resultMap["address"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }
    }
  }
}