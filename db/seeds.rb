josh = User.create(username: "Josh", password: "josh123")
rachel = User.create(username: "Rachel", password: "rachel456")
golden_hour = Vinyl.create(title: "Golden Hour", artist: "Kacey Musgrave", genre: "Country", release_year: "2018", user: rachel)
malibu = Vinyl.create(title: "Malibu", artist: "Anderson Paak", genre: "Hip-Hop", release_year: "2016", user: josh)

SavedVinyl.create(user: rachel, vinyl: golden_hour)
SavedVinyl.create(user: josh, vinyl: malibu)