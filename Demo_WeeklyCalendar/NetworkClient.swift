//
//  NetworkClient.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 28/06/23.
//

import AppKit
//import Foundation


struct NetworkClient {
    
    static let dataParsingError = "Data is not passing through Codable Response Modal"
    
    
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
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let data = try? JSONDecoder().decode(T.self, from: data) {
                    completionHandler(true, data, nil)
                } else {
                    show_API_Error_Alert()
                    completionHandler(false, nil, dataParsingError)
                }
            }
        }
        task.resume()
    }
    
    
    static private func show_API_Error_Alert() {
        let alert = NSAlert()
        alert.messageText = "Oops!"
        alert.informativeText = "Something Went Wrong.\nPlease Try Again Later!"
        alert.alertStyle = NSAlert.Style.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    
    // MARK: ------------ Normal API Calling Request -----------
    /// **Requests API if Network is Reachable and returns the Response as Decodable**
    /// - Parameter method: HTTP Method of Request e.g. GET/POST/PUT
    /// - Parameter apiName: String of API URL
    /// - Parameter param: Optional Parameters to be send with Request API
    /// - Parameter showHud: Shows Loading Screen if value TRUE
    /// - Parameter completionHandler: (Boolean: TRUE if successful request/FALSE if unseccessful request, Response: T? returns T as Decodable(_Your_Response_Model_) if Successful request else returns nil, String?: returns error message as String if error occurs else returns nil)
//    static func networkRequest<T: Decodable>(method: HTTPMethod,
//                                             apiName: String,
//                                             param: Parameters?,
//                                             showHud: Bool = true,
//                                             senderView: UIView? = nil,
//                                             completionHandler:
//                                             @escaping ((_ isSuccess: Bool ,_ response: (T)?) -> Void ,_ errorMessage: String?) -> Void)) {
//        if appDelegate.isNetworkAvailable  {
//            print("\n\n -- Simple Network Request of API ---- \(apiName) ---\n\n")
//            if showHud {
//                Loader.showLoader()
//            }
//            DispatchQueue.main.async {
//                senderView?.animateLoader()
//                AF.request(apiName,
//                           method: method,
//                           parameters: param) { $0.timeoutInterval = 10 }
//                .validate(statusCode: 200...299)
//                .responseData
//                { response in
//                    debugPrint("Response Time == \(response.metrics?.taskInterval.duration)")
//                    switch response.result {
//                    case .success(let responseData):
//                        if let data = try? JSONDecoder().decode(T.self, from: responseData) {
//                            senderView?.remove_Activity_Animator()
//                            completionHandler(true, data)
//                        } else {
//                            show_API_Parsing_Error(apiName, T.self, String(data: responseData, encoding: .utf8))
//                            senderView?.remove_Activity_Animator()
//                            completionHandler(false, nil)
//                            if showHud {
//                                Loader.hideLoader()
//                            }
//                        }
//                    case .failure(let error):
//                        show_API_Error_Message(apiName, error)
//                        senderView?.remove_Activity_Animator()
//                        completionHandler(false, nil)
//                        if showHud {
//                            Loader.hideLoader()
//                        }
//                    }
//                }
//            }
//        } else {
////            NoInternet.showInternetView(noInternetMsg)
//        }
//    }
}
