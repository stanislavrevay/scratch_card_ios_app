//
//  ScratchServices.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//
import SwiftUI

protocol ScratchServicesProtocol {
    func activateCard() async throws -> Bool
}

class ScratchServices: ScratchServicesProtocol {
    private let baseUrl = URL(string: "https://api.o2.sk/version")
    
    private func buildRequest() throws -> URLRequest {
        guard let url = baseUrl else { throw ServiceError.invalidUrl }
        var request = URLRequest(url: url.appending(path: "code"))
        request.httpMethod = "GET"
        return request
    }
    
    func activateCard() async throws -> Bool {
        let request = try buildRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ServiceError.invalidReponse
        }
        
        if try handleHTTPResponse(httpResponse) {
            let decodedData = try JSONDecoder().decode(ActivationResponse.self, from: data)
            if let version = Double(decodedData.ios) {
                if version > 6.1 {
                    return true
                }
                throw ServiceError.versionIsLower
            }
            throw ServiceError.unknownError
            
        }
        return false
    }
    
    private func handleHTTPResponse(_ response: HTTPURLResponse) throws -> Bool {
        switch response.statusCode {
            case 200..<300:
                return true
            case 300..<400:
                throw ServiceError.redirectionNeeded
            case 400..<500:
                throw ServiceError.clientError
            case 500..<600:
                throw ServiceError.serverError
            default:
                throw ServiceError.unknownError
        }
    }
}

enum ServiceError: Error {
    case invalidUrl
    case invalidReponse
    case redirectionNeeded
    case clientError
    case serverError
    case unknownError
    case versionIsLower
    
    var localizedDescription: String {
        switch self {
            case .invalidUrl:
                return "Invalid URL"
            case .invalidReponse:
                return "Invalid Reponse - unable to decode response as HTTPURLResponse"
            case .redirectionNeeded:
                return "Redirection Needed"
            case .clientError:
                return "Client Error"
            case .serverError:
                return "Server Error"
            case .unknownError:
                return "Unknown Error"
            case .versionIsLower:
                return "Version is lower"
        }
    }
}
