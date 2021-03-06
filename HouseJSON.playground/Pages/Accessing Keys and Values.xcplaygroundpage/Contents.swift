//: [Previous](@previous)
import Foundation

let json = """
{
    "100": {
        "type": "colonial",
        "location": "Plainville, MA",
        "bedrooms": 3,
        "bathrooms": 2.5,
        "has air conditioning": false,
        "amenities": ["basement", "garden"],
        "listing": {
            "price": 430000,
            "date": "May 2018"
        }
    },
    "101": {
        "type": "condo",
        "location": "San Francisco, CA",
        "bedrooms": 1,
        "bathrooms": 1,
        "has air conditioning": true,
        "amenities": [],
        "listing": {
            "price": 765000,
            "date": "September 2018"
        }
    }
}
""".data(using: .utf8)!

struct Listing: Codable {
    let price: Int
    let date: String
}

struct House: Codable {
    let houseType: String
    let location: String
    let beds: Int
    let baths: Float
    let hasAirConditioning: Bool
    let amenities: [String]
    let listing: Listing
    
    enum CodingKeys: String, CodingKey {
        case houseType = "type"
        case location = "location"
        case beds = "bedrooms"
        case baths = "bathrooms"
        case hasAirConditioning = "has air conditioning"
        case amenities
        case listing
    }
}

let decoder = JSONDecoder()
do {
    let houseDict = try decoder.decode([String: House].self, from: json)
    print(houseDict)
    let houses = houseDict.values.map({$0})
    let houseIds = houseDict.keys.map({$0})
    print(houses)
    print(houseIds)
} catch {
    print(error)
}

//: [Next](@next)
