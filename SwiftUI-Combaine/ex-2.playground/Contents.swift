import UIKit
import Combine
 
// (1) Create a new publisher operatot, to square each value, useing `map`

[1,2,4]
    .publisher
    .map{ $0 * $0 }
    .sink { ($0)}

// (2) Use `decode()` with `map()` to convert to REST response to an object
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

struct Task : Decodable {
    let id : Int
    let title : String
    let userId : Int
    let body: String
}

let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
    .map{$0.data}
    .decode(type: [Task].self, decoder: JSONDecoder())

let cancellableSink = dataPublisher
    .sink(receiveCompletion: { (completion) in
        print(completion)
    }) { (item) in
        print(item)
}
//.decode
