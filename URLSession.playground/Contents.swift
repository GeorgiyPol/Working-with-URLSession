import Foundation

//MARK: - task1

let firstNetworkClass = NetworkClass()
let fishStruct = FishStruct()

let tryCreateURL = firstNetworkClass.makeURL(scheme: fishStruct.fishScheme,
                                             host: fishStruct.fishHost,
                                             path: fishStruct.fishPath,
                                             queryItems: nil)

firstNetworkClass.getData(urlRequest: tryCreateURL) //parse types of fish

//MARK: - task2*

let marvelStruct = MarvelStruct()
let hash = firstNetworkClass.MD5(string: marvelStruct.dataToMD5)

let queryItemsMarvel = [
                        URLQueryItem(name: "ts", value: marvelStruct.ts),
                        URLQueryItem(name: "apikey", value: marvelStruct.publicKey),
                        URLQueryItem(name: "hash", value: hash)
                        ]

let tryCreateMarvelURL = firstNetworkClass.makeURL(scheme: marvelStruct.marvelScheme,
                                              host: marvelStruct.marvelHost,
                                              path: marvelStruct.marvelPath,
                                              queryItems: queryItemsMarvel)

firstNetworkClass.getData(urlRequest: tryCreateMarvelURL) //parse Gamora hero
