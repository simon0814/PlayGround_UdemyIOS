//
//  Order.swift
//  HotCoffee
//
//  Created by simon li on 23/5/2022.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappucino
    case latte
    case longblack
    case flatwhite
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}


struct Order: Codable {
    
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
    
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        return Resource<[Order]>(url:url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order")
        }
        var resourse = Resource<Order?>(url: url)
        resourse.httpMethod = HttpMethod.post
        resourse.body = data
        return resourse
    }
    
}

extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
    
}
