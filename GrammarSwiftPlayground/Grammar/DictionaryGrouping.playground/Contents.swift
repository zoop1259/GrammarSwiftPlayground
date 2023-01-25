import UIKit

enum FriendType {
    case normal, best
}

struct Friend {
    var name : String
    var type : FriendType
}

var friendList = [
    Friend(name: "강", type: .best),
    Friend(name: "김", type: .best),
    Friend(name: "최", type: .normal),
    Friend(name: "박", type: .normal)
]

let groupedFriends = Dictionary(grouping: friendList, by: { $0.type })
print(groupedFriends)
print(groupedFriends[.normal])
print(groupedFriends[.best])

//또 다른 방법
let anotherGroupedFriends = Dictionary(grouping: friendList, by: {(friend) -> FriendType in
    return friend.type
})
let anotherGroupedFriends2 = Dictionary(grouping: friendList) { friend in
    return friend.type
}

print(anotherGroupedFriends)
print(anotherGroupedFriends2)
