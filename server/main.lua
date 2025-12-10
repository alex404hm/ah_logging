local oxmysql = exports.oxmysql

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local player = source
    local identifiers = {
        steam = nil,
        discord = nil,
        xbl = nil,
        live = nil,
        license = nil,
        license2 = nil,
        fivem = nil,
        ip = nil
    }
    local ip = GetPlayerEndpoint(player)
    for _, id in ipairs(GetPlayerIdentifiers(player)) do
        if id:sub(1, 5) == "steam" then
            identifiers.steam = id
        elseif id:sub(1, 7) == "discord" then
            identifiers.discord = id
        elseif id:sub(1, 3) == "xbl" then
            identifiers.xbl = id
        elseif id:sub(1, 4) == "live" then
            identifiers.live = id
        elseif id:sub(1, 7) == "license" then
            if not identifiers.license then
                identifiers.license = id
            else
                identifiers.license2 = id
            end
        elseif id:sub(1, 5) == "fivem" then
            identifiers.fivem = id
        end
    end

    oxmysql:execute("SELECT license FROM player_logs WHERE steam = ?", { identifiers.steam }, function (result)
        if #result == 0 then
            oxmysql:insert("INSERT INTO player_logs (steam, discord, xbl, live, license, license2, fivem, ip) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", {identifiers.steam, identifiers.discord, identifiers.xbl, identifiers.live, identifiers.license, identifiers.license2, identifiers.fivem, ip})
        end
    end)
end)
