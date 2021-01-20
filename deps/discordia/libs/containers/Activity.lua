--[=[
@c Activity
@d Represents a Discord user's presence data, either plain game or streaming presence or a rich presence.
Most if not all properties may be nil.
]=]

local Container = require('containers/abstract/Container')

local Activity, get = require('class')('Activity', Container)

function Activity:__init(data, parent)
	Container.__init(self, data, parent)
	return self:_loadMore(data)
end

function Activity:_load(data)
	Container._load(self, data)
	return self:_loadMore(data)
end

function Activity:_loadMore(data)
	local timestamps = data.timestamps
	self._start = timestamps and timestamps.start
	self._stop = timestamps and timestamps['end'] -- thanks discord
	local assets = data.assets
	self._small_text = assets and assets.small_text
	self._large_text = assets and assets.large_text
	self._small_image = assets and assets.small_image
	self._large_image = assets and assets.large_image
	local party = data.party
	self._party_id = party and party.id
	self._party_size = party and party.size and party.size[1]
	self._party_max = party and party.size and party.size[2]
end

--[=[@p start number/nil The Unix timestamp for when this Rich Presence activity was started.]=]
function get.start(self)
	return self._start
end

--[=[@p stop number/nil The Unix timestamp for when this Rich Presence activity was stopped.]=]
function get.stop(self)
	return self._stop
end

--[=[@p name string/nil The game that the user is currently playing.]=]
function get.name(self)
	return self._name
end

--[=[@p type number/nil The type of user's game status. See the `gameType`
enumeration for a human-readable representation.]=]
function get.type(self)
	return self._type
end

--[=[@p url string/nil The URL that is set for a user's streaming game status.]=]
function get.url(self)
	return self._url
end

--[=[@p applicationId string/nil The application id controlling this Rich Presence activity.]=]
function get.applicationId(self)
	return self._application_id
end

--[=[@p state string/nil string for the Rich Presence state section.]=]
function get.state(self)
	return self._state
end

--[=[@p details string/nil string for the Rich Presence details section.]=]
function get.details(self)
	return self._details
end

--[=[@p textSmall string/nil string for the Rich Presence small image text.]=]
function get.textSmall(self)
	return self._small_text
end

--[=[@p textLarge string/nil string for the Rich Presence large image text.]=]
function get.textLarge(self)
	return self._large_text
end

--[=[@p imageSmall string/nil URL for the Rich Presence small image.]=]
function get.imageSmall(self)
	return self._small_image
end

--[=[@p imageLarge string/nil URL for the Rich Presence large image.]=]
function get.imageLarge(self)
	return self._large_image
end

--[=[@p partyId string/nil Party id for this Rich Presence.]=]
function get.partyId(self)
	return self._party_id
end

--[=[@p partySize number/nil Size of the Rich Presence party.]=]
function get.partySize(self)
	return self._party_size
end

--[=[@p partyMax number/nil Max size for the Rich Presence party.]=]
function get.partyMax(self)
	return self._party_max
end

return Activity
