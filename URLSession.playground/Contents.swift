import Foundation

//MARK: - task1

let firstNetworkClass = NetworkClass()
let fishStruct = FishStruct()

let tryCreateURL = firstNetworkClass.makeURL(scheme: fishStruct.fishScheme,
                                             host: fishStruct.fishHost,
                                             path: fishStruct.fishPath,
                                             queryItems: nil)

firstNetworkClass.getData(urlRequest: tryCreateURL) //parse types of fish
