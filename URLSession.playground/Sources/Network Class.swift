import Foundation
import CryptoKit

public class NetworkClass {
    
    public init() {}
    
    public func makeURL(scheme: String,
                        host: String,
                        path: String,
                        queryItems: [URLQueryItem]?) -> String {

        var components = URLComponents()
        
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let componentsString = components.string else { return "an error occurred in the line, double-check" }
        
        return componentsString
    }
    
    public func getData(urlRequest: String) {
                
        let urlRequest = URL(string: urlRequest)
        guard let url = urlRequest else { return }
        let configuration: URLSessionConfiguration = .default
        let session = URLSession(configuration: configuration)

        session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("There was an error: \(String(describing: error?.localizedDescription))")

            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                guard let data = data else { return }
                let dataAsString = String(data: data, encoding: .utf8)
                guard let dataInfo = dataAsString else { return }
                print(dataInfo)

            } else if let response = response as? HTTPURLResponse, (400...499).contains(response.statusCode) {
                print("Unexpected Client Error! Error code: \(response.statusCode)")

            } else if let response = response as? HTTPURLResponse, (500...511).contains(response.statusCode) {
                print("Unexpected Server Error! Error code: \(response.statusCode)")

            }
        }.resume()
    }
    
    public func MD5(string: String) -> String {
        
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
