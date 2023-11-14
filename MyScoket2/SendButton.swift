//
//  SendButton.swift
//  MyScoket2
//
//  Created by 백승철 on 11/15/23.
//

import SwiftUI

struct SendButton: View {
    var body: some View {
        Button(action: {
            let retVal = sendTcpMessage(ip: "localhost", message: "Test Client")
            print("retVale: \(retVal)")
            
        }, label: {
            Text("Send Button")
        })
    }
    
    func sendTcpMessage(ip: String, message: String) -> Int {
        var returnValue: Int = 0
        let client = TCPClient(address: ip, port: 5555)
        
        switch client.connect(timeout: 100) {
        case .success:
            switch client.send(string: message) {
            case .success:
                guard let receivedData = client.read(1024, timeout: 1000) else {
                    returnValue = 2
                    print("test returnValue 2")
                    break
                }
                
                if let response = Data(bytes: receivedData as [UInt8], count: receivedData.count) as Data? {
                    let str = String(decoding: response, as: UTF8.self)
                    print("recved: \(str)")
//                    print(response.base64EncodedString())
                    returnValue = 1 // success
                }
            case .failure( _):
                returnValue = 3
            }
        case .failure( _):
            returnValue = 4
        }
        
        print("client close")
        client.close()
        // 3 send data with tcp
        
        return returnValue
    }
}

#Preview {
    SendButton()
}
