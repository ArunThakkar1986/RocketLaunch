import Foundation

// MARK: - Welcome
struct RocketLaunches: Codable {
    let validAuth: Bool
    let count, limit, total, lastPage: Int
    let result: [Result]

    enum CodingKeys: String, CodingKey {
        case validAuth = "valid_auth"
        case count, limit, total
        case lastPage = "last_page"
        case result
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let sortDate: String?
    let name: String?
    let launchDescription: String?
    let tags: [Tag]?
    let pad: Pad?

    enum CodingKeys: String, CodingKey {
        case id
        case sortDate = "sort_date"
        case name
        case launchDescription = "launch_description"
        case tags
        case pad
    }
}

// MARK: - Pad
struct Pad: Codable {
    let id: Int?
    let name: String?
    let location: Location?
}

// MARK: - Location
struct Location: Codable {
    let id: Int?
    let name: String?
    let state, statename: String?
    let country:String?
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let text: String
}
