import UIKit
import Apollo
import Starscream

// Change localhost to your machine's local IP address when running from a device
//let apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)

let endpointURL = URL(string: "http://localhost:3000/graphql")
let wsEndpointURL = URL(string: "ws://localhost:3000/subscriptions")
let websocket = WebSocketTransport(url: wsEndpointURL!)
let splitNetworkTransport = SplitNetworkTransport(httpNetworkTransport: HTTPNetworkTransport(url: endpointURL!), webSocketNetworkTransport: websocket)
let apollo = ApolloClient(networkTransport: splitNetworkTransport)


// This is the "logged in" user, hardcoded for simplicity
let currentUser = "ios"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["id"] }
        
        return true 
    }
}
