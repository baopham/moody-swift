import Vapor
import HTTP

final class MoodController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try Mood.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var mood = try request.mood()
        try mood.save()
        return mood
    }
    
    func show(request: Request, mood: Mood) throws -> ResponseRepresentable {
        return mood
    }
    
    func delete(request: Request, mood: Mood) throws -> ResponseRepresentable {
        try mood.delete()
        return JSON([:])
    }
    
    func clear(request: Request) throws -> ResponseRepresentable {
        try Mood.query().delete()
        return JSON([])
    }
    
    func update(request: Request, mood: Mood) throws -> ResponseRepresentable {
        let new = try request.mood()
        var mood = mood
        mood.name = new.name
        mood.longitude = new.longitude
        mood.latitude = new.latitude
        try mood.save()
        return mood
    }
    
    func replace(request: Request, mood: Mood) throws -> ResponseRepresentable {
        try mood.delete()
        return try create(request: request)
    }
    
    func makeResource() -> Resource<Mood> {
        return Resource(
            index: index,
            store: create,
            show: show,
            replace: replace,
            modify: update,
            destroy: delete,
            clear: clear
        )
    }
}

extension Request {
    func mood() throws -> Mood {
        guard let json = json else { throw Abort.badRequest }
        return try Mood(node: json)
    }
}
