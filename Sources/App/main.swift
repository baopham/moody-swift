import Vapor
import VaporPostgreSQL

let drop = Droplet(preparations: [Mood.self])

// MARK: - Routes

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("api/moods", MoodController())

// MARK: - Providers

try drop.addProvider(VaporPostgreSQL.Provider.self)

drop.run()
