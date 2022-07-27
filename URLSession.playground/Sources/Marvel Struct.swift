import Foundation

public struct MarvelStruct {
    
    public var marvelScheme = "https"
    public var marvelHost = "gateway.marvel.com"
    public var marvelPath = "/v1/public/characters/1010763"
    
    public var ts = "100"
    public var publicKey = "31a63b3b088f1225ef9e5d5f56a97b85"
    public var privateKey = "3adc415e071e5bc6db0bd003ad1ce215277ec73b"
    
    public var dataToMD5: String { //md5(ts+privateKey+publicKey)
        ts + privateKey + publicKey
    }
    
    public init() {}
}
