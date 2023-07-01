//
//  NetworkClient.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 28/06/23.
//

import AppKit

// MARK: - Network Client
struct NetworkClient {
    
    static let dataParsingError = "Data is not passing through Codable Response Modal"
    
    // MARK: ------------ Normal API Calling Request -----------
    /// **Requests API if Network is Reachable and returns the Response as Decodable**
    /// - Parameter completionHandler: (Boolean: TRUE if successful request/FALSE if unseccessful request, Response: T? returns T as
    static func networkRequest<T: Decodable>(completionHandler:
                                             @escaping ((_ isSuccess: Bool, _ response: (T)?, _ errorMessage: String?) -> Void)) {
        
        let queryParams = [URLQueryItem(name: "UserId", value: "486"),
                           URLQueryItem(name: "date", value: "2023-06-10 11:58:18.020")]
        guard var mainUrl = URLComponents(string: "http://myapp.airis.co.in/AIRISApi/API/DLEvent/GetDLEventList") else {
            debugPrint("Can't Initialize URL")
            return
        }
        mainUrl.queryItems = queryParams
        
        var request = URLRequest(url: mainUrl.url!)
        request.addValue("Basic 486:m0iZ/RxG20h32QJxByUnSqjB9AaTXq4T", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let data = try? JSONDecoder().decode(T.self, from: data) {
//                    dump(data)
                    completionHandler(true, data, nil)
                } else {
                    show_API_Error_Alert()
                    completionHandler(false, nil, dataParsingError)
                }
            }
        }
        task.resume()
    }
    
    
    static func show_API_Error_Alert() {
        let alert = NSAlert()
        alert.icon = nil
        alert.messageText = "Oops!"
        alert.informativeText = "Something Went Wrong.\nPlease Try Again Later!"
        alert.alertStyle = NSAlert.Style.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}
