//
//  ServiceAssembly.swift
//  Robots
//
//  Created by Сергей Полозов on 26.09.17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Foundation

class ServiceAssembly {

    func scheduler() -> Scheduler {
        return GCDScheduler()
    }

    func transport() -> Transport {
        return AlamofireTransport()
    }

    func deserializer() -> Deserializer {
        return JSONDeserializer()
    }

    func dateFormatter() -> DateFormatter {
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }
}
