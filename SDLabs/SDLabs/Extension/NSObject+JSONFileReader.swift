//
//  NSObject+JSONFileReader.swift
//  SDLabs
//
//  Created by Pardeep on 22/11/18.
//  Copyright © 2018 Pardeep. All rights reserved.
//

import Foundation

extension NSObject {

    func readJson(_ filename: String) -> AnyObject! {
        do {
            if let file = Bundle.main.url(forResource: filename, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is an Dictionary
                    print(object)
                    return object as AnyObject
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    return object as AnyObject
                } else {
                    return "JSON is invalid" as AnyObject
                }
            } else {
                return "No File Found" as AnyObject
            }

        } catch {
            print(error.localizedDescription)
            return error.localizedDescription as AnyObject
        }
    }

    func jsonToCodable<T: Codable>(json: [String: Any], codable: T.Type) -> T? {

        let decoder = JSONDecoder()
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let codable = try decoder.decode(codable, from: data)
            return codable

        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

}
