import Vapor
import Fluent

final class Mood: Model {
    var id: Node?
    var name: String
    var longitude: Double
    var latitude: Double
    var exists: Bool = false
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        longitude = try node.extract("longitude")
        latitude = try node.extract("latitude")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "longitude": longitude,
            "latitude": latitude
        ])
    }
    
    // MARK: - Migration
    static func prepare(_ database: Database) throws {
        try database.create("moods") { moods in
            moods.id()
            moods.string("name")
            moods.double("longitude")
            moods.double("latitude")
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete("moods")
    }
}
