local files = {
	["20"] = FileManager.new({
		type = "dictionary",
		-- will only have these objects, so it has a premade map
		map = {
			{
				name = "maps",
				type = "array",
				-- no length so it can only have the next object type
				objects = {
					type = "number"
				}
			},
			{
				name = "ranks",
				type = "dictionary",
				objects = {
					type = "number"
				}
			},
			{
				name = "modchat",
				type = "string",
				-- has a premade length
				length = 10
			}
		}
	}):disableValidityChecks():prepare(), -- disables validity checks so it writes faster and prepares the manager structure

	["21"] = FileManager.new({
		type = "dictionary",
		map = {
			{
				name = "ranking",
				type = "array",
				objects = {
					type = "array",
					-- it will only have these objects, so we use a map
					map = {
						{
							type = "number"
						},
						{
							type = "string",
						},
						{
							type = "number"
						},
						{
							type = "string",
							length = 2
						}
					}
				}
			},
			{
				name = "weekranking",
				type = "array",
				objects = {
					type = "array",
					map = {
						{
							type = "number"
						},
						{
							type = "string",
						},
						{
							type = "number"
						},
						{
							type = "string",
							length = 2
						}
					}
				}
			}
		}
	}):disableValidityChecks():prepare(),

	["22"] = FileManager.new({
		type = "dictionary",
		map = {
			{
				name = "lowmaps",
				type = "array",
				objects = {
					type = "number"
				}
			},
			{
				name = "banned",
				type = "dictionary",
				objects = {
					type = "number"
				}
			}
		}
	}):disableValidityChecks():prepare()
}

function eventFileLoaded(file, data)
	local manager = files[file]
	data = manager:load(data) -- load the data

	-- edit your data here!

	system.saveFile(manager:dump(data), file) -- save the data
end