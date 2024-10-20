rest={}

http = require "socket.http"

function rest.post(uri, body)
    respbody = {
        result, respcode, respheaders, respstatus = http.request {
            method = "POST",
            url = "https://example.org",
            source = ltn12.source.string(body),
            headers = {
                ["content-type"] = "application/json",
                ["content-length"] = tostring(#body)
            },
            sink = ltn12.sink.table(respbody)
        }
    }
    respbody = table.concat(respbody)
end

