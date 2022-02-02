//
//  NetworkManager.swift
//  Random
//
//  Created by Andrey Dorofeev on 02.12.2021.
//

import Foundation
import UIKit

class NetworkManager {
    
    func smartURLForString(string: String) -> URL? {
        let trimmedString = string.trimmingCharacters(in: .whitespaces)
        guard !trimmedString.isEmpty else { return nil }
        
        if trimmedString.contains("://") {
            return URL(string: trimmedString)
        } else {
            return URL(string: "http://" + trimmedString)
        }
    }
    
    func pathForTestImage(number: Int) -> String? {
        #if targetEnvironment(simulator)
        let power = number
        #else
        let power = number - 1
        #endif
        
        guard let originalIFilePath = Bundle.main.path(forResource: "dinosaur-23166_1280", ofType: "png") else { return nil }
        
        do {
            let fileManager = FileManager.default
            
            var attrs: [FileAttributeKey: Any]? = try fileManager.attributesOfItem(atPath: originalIFilePath)
            guard let originalFileSize = attrs?[.size] as? UInt64 else { return nil }
            
            let bigFilePath = NSTemporaryDirectory() + "dinosaur-23166_1280.png"
            attrs = try? fileManager.attributesOfItem(atPath: bigFilePath)
            
            let bigFileSize: UInt64 = attrs?[.size] as? UInt64 ?? 0
            let expansionFactor = NSDecimalNumber(decimal: pow(10, power)).uint64Value
            
            if bigFileSize != originalFileSize * expansionFactor {
                print("\(expansionFactor) - \(bigFilePath)")
                
                guard let bigFileStream = OutputStream(toFileAtPath: bigFilePath, append: false) else { return nil }
                bigFileStream.open()
                
                let data = try NSData(contentsOfFile: originalIFilePath, options: .mappedIfSafe)
                let dataBuffer = data.bytes.assumingMemoryBound(to: UInt8.self)
                let dataLength = data.length
                
                for _ in 0..<expansionFactor {
                    var dataOffset = 0
                    while dataOffset != dataLength {
                        let bytesWritten = bigFileStream.write(
                            dataBuffer.advanced(by: dataOffset),
                            maxLength: dataLength - dataOffset
                        )
                        dataOffset += bytesWritten
                    }
                }
                bigFileStream.close()
            }
            return bigFilePath
        } catch {
            print("pathForTestImage error \(error)")
            return nil
        }
    }
}
