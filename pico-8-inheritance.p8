pico-8 cartridge // http://www.pico-8.com
version 11
__lua__

function kind(parent, child)
	local k = copy(parent)

	merge(k, child)

	return k
end

function copy(o)
	local c

	-- copy the supplied entity
	if type(o) == "table" then
		c = {}

		for k, v in pairs(o) do
			c[k] = copy(v)
		end
	else
		-- handle single variable copies
		c = o
	end

	return c
end

function merge(t1, t2)
	for k,v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
end

vec = {
	x = 0,
	y = 0,
}

function vec:add(v)
	self.x += v.x
	self.y += v.y
end

function vec:subs(v)
	self.x -= v.x
	self.y -= v.y
end

function vec:mult(c)
	self.x *= c
	self.y *= c
end

vec3 = kind(vec, {
	z = 0,
	test = {a = 1, b = 2, c = 3},
})

function vec3:printz()
	printh("z: "..self.z)
end

function vec3:printtest()
	printh("vec3:printtest(): "..self.test.a.." "..self.test.b.." "..self.test.c)
end

vec4 = kind(vec3, {
	t = 0,
	test2 = {a = 4, b = 5, c = 6},
})

function vec4:printt()
	printh("t: "..self.t)
end

function vec4:printtest2()
	printh("vec4:printtest2(): "..self.test2.a.." "..self.test2.b.." "..self.test2.c)
end

function _draw()
	cls()
end

function _init()
	a = copy(vec)
	b = copy(vec)
	a.x = 1
	a.y = 2
	b.x = 3
	b.y = -1

	printh("a: "..a.x.." "..a.y)
	printh("b: "..b.x.." "..b.y)

	a:add({x = 3, y = 3})
	printh("a: "..a.x.." "..a.y)

	c = copy(vec3)
	c.z=3

	printh("c: "..c.x.." "..c.y.." "..c.z)

	c:add({x = 2, y = 2})
	printh("c: "..c.x.." "..c.y.." "..c.z)

	c:printz()

	printh("a: "..a.x.." "..a.y)
	printh("b: "..b.x.." "..b.y)
	printh("c: "..c.x.." "..c.y.." "..c.z)

	c:printtest()

	d = copy(vec4)
	d.t=3
	d:printt()
	d:printtest()
	d:printtest2()
end

function _update()
end

__gfx__
00000000cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccc
00000000cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000ccccccccccc555cccc1661ccccc555ccccc777cc
00700700cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000ccc888cccc55757cc161111ccc55757ccc77777c
00077000cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000cc88888ccc57090ccc17090ccc57090ccc77090c
00077000cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000ccc8090ccc16777ccc57777ccc22222ccc77777c
00700700cccccccccccccccccccccccccccccccc000000000000000000000000000000000000000000000000ccc5777ccc61777ccc57777cc222222cccc777cc
00000000cccccc11111ccccccccccccccccccccc000000000000000000000000000000000000000000000000ccc5777ccc17777ccc57777cc227777ccc7777cc
00000000ccccc1199911cccccccccc11111ccccc000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccccccccccc
77777ccccccc119fff91ccccccccc1199911cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c777cccccccc19f44f41cccccccc119fff91cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cc7cccccccc119ff4f411ccccccc19f44f41cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccc19ffffff91cccccc119ff4f411ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccc19f7777f91cccccc19f7777f91ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccc199ffff991cccccc199ffff991ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccccccc1199999911cccccc1199999911ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
cccccccccccc11111111cccccccc11111111cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ccccccc111ccccccccccccccccccccccccccccc111ccccccccccccc111cccccccccccc111ccccccccccccccccccccccccc11111ccccccccccccccccccccccccc
ccccc1117111ccccccccccc111ccccccccccc1117111ccccccccc1117111cccccccc1117111ccccccccccccc111ccccccc17171ccccccccccccccccccccccccc
cccc116777711cccccccc1117111cccccccc116777711ccccccc116777711cccccc116777711cccccccccc1117111ccccc16711c111c1111cccccccccccccccc
ccc1176777771ccccccc116777711cccccc1176777771cccccc1176777771ccccc1176777771ccccccccc116777711cccc1171cc17111671cccccccccccccccc
ccc17766777711ccccc1176777771cccccc17766777711ccccc17766777711ccc111766777711ccccccc1176777771ccccc1711c117777d1cccccccccccccccc
ccc17677777771ccccc17766777711ccccc17677777771ccccc17677777771cc1161677777771ccccccc17766777711ccc11761c17611171cccccccccccccccc
ccc17775576651ccccc17677777771ccccc17775576651ccccc17775576651cc1761775576651ccccccc17677777771ccc17d71c1111c111cccccc111111cccc
ccc11775576651ccccc17775576651ccccc11775576651ccccc11775576651cc1171175576651ccccccc17775576651ccc11111ccccccccccccc111775511ccc
cccc1777776711ccccc11775576651cccccc1777776711cccccc1777776711ccc117117776711ccccccc11775576651ccccccccc00000000cccc177776671ccc
cccc111117711ccccccc1777776711cccccc111117711ccccccc111117711ccccc1761117711ccccccccc1777776711ccccccccc00000000ccc1177776661ccc
cccc11161111cccccccc111117711cccccccc1167111cccccccc11161111cccccc1d7161111cccccccccc111117711cccccccccc00000000ccc1777755771ccc
ccc11777711cccccccc117771111ccccccccc177711cccccccc117777d1ccccccc111777711cccccccccc11771111ccccccc111100000000ccc1776755771ccc
ccc171161d1cccccccc171161d1cccccccccc1d6161cccccccc17116711ccccccccc11161d1cccccccccc1d61771cccc1111176100000000ccc1666777771ccc
ccc111777111ccccccc111777111ccccccc11177661cccccccc1116771cccccccccc11777111cccccccc11777111cccc1777777100000000ccc1777677771ccc
cccc17711771cccccccc17711771ccccccc17711111cccccccccc16611cccccccccc17711771cccccccc17711771cccc167d111100000000ccc1177777711ccc
cccc11111111cccccccc11111111ccccccc1111cccccccccccccc1111ccccccccccc11111111cccccccc11111111cccc11111ccc00000000cccc11111111cccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc00000000
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc11111cccccccccccccccccc00000000
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc13331cc1111111ccccccccc00000000
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc13331cc1333331c111c111c00000000
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc13b31cc133b331c1311131100000000
ccccc11111ccccccccccccccccccccccccccc11111ccccccccccc11111ccccccccccc11111ccccccccccc11111ccccccc13331cc1333331c1331333100000000
cccc11888111cccccccc111111cccccccccc11888111cccccccc11888111ccccccc111188111cccccccc11888111ccccc13331cc1111111c133bb31100000000
ccc1188888811cccccc118888111ccccccc1188888811cccccc1188888811cccccc1311888811cccccc1188888811cccc11111cccccccccc1111111c00000000
ccc1888888881cccccc1888888811cccccc1888888881cccccc1888888881ccccc11331188881cccccc18888888811cc00000000000000000000000000000000
ccc1888875571cccccc1188888881cccccc1888875571cccccc1888875571ccccc133b3115571cccccc18888755731cc00000000000000000000000000000000
ccc1185707901ccccccc188875571cccccc1185707901cccccc1185707901ccccc1133331790111cccc11857079031cc00000000000000000000000000000000
ccc1188888881cccccc1185707901cccccc1188888881cccccc1188888881cccccc113351888551cccc11888888851cc00000000000000000000000000000000
ccc1888888881ccccc11888888881cccccc1888888881cccccc1888888881cccccc111558888111cccc18855588851cc00000000000000000000000000000000
ccc1885777771ccccc18888888881cccccc1885777791cccccc1885977771cccccc1885777771cccccc18857777711cc00000000000000000000000000000000
ccc1159977791ccccc11159977791cccccc1155777791cccccc1155977771cccccc1159977791cccccc1159977791ccc00000000000000000000000000000000
cccc111111111ccccccc111111111ccccccc111111111ccccccc111111111ccccccc111111111ccccccc111111111ccc00000000000000000000000000000000
ccc11111111cccccc1111c1111ccccccccc11111111cccccc1111c1111cccccccc11111111cccccccccc11111111ccccc111111c000000000000000000000000
c111999999111cccc1991119911cccccc111999999111cccc1991119911ccccc111999999111cccccc111999999111cc11dd6411000000000000000000000000
c199990900991cccc179999999111cccc199990900991cccc179999999111ccc199990900991cccccc199990900991cc15d604d1000000000000000000000000
c1799966666611ccc199990900991cccc1799966666611ccc199990900991ccc1799966666611ccccc1799966666611c15d600d1000000000000000000000000
c1999666666661ccc1999966666611ccc1999666666661ccc1999966666611cc1999666666661ccccc1999666666661c15ddddd1000000000000000000000000
c1966677777771ccc1999666666661ccc1966677777771ccc1999666666661cc1966677777771ccccc1966677777771c155dddd1000000000000000000000000
c116677a079901ccc1166677777771ccc116677a079901ccc1166677777771cc1166770079901ccccc1166770079901c11555511000000000000000000000000
cc16777a079901cccc16677a079901cccc16777a079901cccc16677a079901ccc16777a079901cccccc16777a079901cc111111c000000000000000000000000
cc117777779771cccc16777a079901cccc117777779771cccc16777a079901ccc117777779771cccccc117777779771c00000000000000000000000000000000
ccc11777777711cccc117777779771cc1111177777771111cc117777779771cccc1177777771111cc11177777777711c00000000000000000000000000000000
ccc11777777771ccccc11777777711cc1777777777777771ccc11777777711ccccc117777777771cc1777777777711cc00000000000000000000000000000000
cc1177777777711ccc1177777777711c1177777777779711cc117777777711cccc1177777777711cc1177777777711cc00000000000000000000000000000000
cc1777777777771cc117777777777711c11177777777911cc11777797777711ccc1777777777771cc1777777777771cc00000000000000000000000000000000
cc1777777777771cc177777777777771cc177777777791ccc17777797777771ccc1777777777771cc1777777777771cc00000000000000000000000000000000
cc1179997777991cc11779997777991ccc117777777711ccc11177797777111ccc1179997777991cc1179997777991cc00000000000000000000000000000000
ccc111111111111ccc1111111111111cccc1111111111cccccc1111111111cccccc111111111111ccc111111111111cc00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbb44444444bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000cccccccccccccccc
bbbbbbbbbbbbbbbb44444444bbbb33bbb3bbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000cccccccccccccccc
bbbbb3bbbbbbbbbb44444444bb3444444453bb3444334bbb0000000000000000000000000000000000000000000000000000000000000000ccccc111111ccccc
bb3b3bbbbbbbbbbb44444444bb54444444444444444445bb0000000000000000000000000000000000000000000000000000000000000000ccc1119999111ccc
b3bb3b3bbbbbbbbb44444444bb44444444444444444444bb0000000000000000000000000000000000000000000000000000000000000000ccc1992222991ccc
bbbbbbbbbd11d1db44444444b344444444444444444444bb0000000000000000000000000000000000000000000000000000000000000000cc112299992211cc
bbbbbbbbd6666d6d44444444b34445d444444444444444bb0000000000000000000000000000000000000000000000000000000000000000cc142422224421cc
bbbbbbbbd666666d44444444b34442444444444444d543bb0000000000000000000000000000000000000000000000000000000000000000cc142444244421cc
d6666666666666666666666dbb34444444444444444443bb0000000000000000000000000000000000000000000000000000000000000000cc192444244491cc
16666666666666666666666dbb3444444444444444444bbb0000000000000000000000000000000000000000000000000000000000000000cc129944249921cc
d6666666666666666666666dbbb4444444444444444443bb0000000000000000000000000000000000000000000000000000000000000000cc142299992221cc
d66666666666666666666661bb44444444444444444445bb0000000000000000000000000000000000000000000000000000000000000000cc142422224421cc
d66666666666666666666661b344444444445d44444444bb0000000000000000000000000000000000000000000000000000000000000000cc112444244411cc
16666666666666666666666db344444444455544444444bb0000000000000000000000000000000000000000000000000000000000000000ccc1994424991ccc
16666666666666666666666db344454444422244444444bb0000000000000000000000000000000000000000000000000000000000000000ccc1119999111ccc
d6666666666666666666666dbb44444444444244444443bb0000000000000000000000000000000000000000000000000000000000000000ccccc111111ccccc
bbbbbbbb1666666d00000000bb44444444444444d54444bb0000000000000000000000000000000000000000000000000000000000000000cccccccccccccccc
bbbbbbbb166d666100b33003bb34444444444444524443bb0000000000000000000000000000000000000000000000000000000000000000ccc111cccc11111c
bbbbbbbb1ddd1111b3bbbb3bbb44444444445444444444bb0000000000000000000000000000000000000000000000000000000000000000ccc1a1ccc11aaa11
bbbbbbbb166d11d1bbbbbbbbbb44444444442444444443bb0000000000000000000000000000000000000000000000000000000000000000ccc1a1ccc1a99aa1
bbbbbbbb1d66d1d1bbbbbbbbbb34444444444444444443bb0000000000000000000000000000000000000000000000000000000000000000ccc1a1ccc1a9aaa1
bbbbbbbb1dd1d1d1bbbbbbbbbbb54443b3544b3443445bbb0000000000000000000000000000000000000000000000000000000000000000ccc191ccc19aaaa1
bbbbbbbb11d1d1d1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000ccc191ccc1199a11
bbbbbbbb31d33113bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000ccc111cccc11111c
3bb3bbb300000000444443bbbb344444444444444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000
133d3331000000004444445bb3444444445d44444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000
1ddd11110000000044444444b44444d4455544444555444400000000000000000000000000000000000000000000000000000000000000000000000000000000
166d11d1000000004444444444444444422244444422444400000000000000000000000000000000000000000000000000000000000000000000000000000000
1d66d1d100000000444d444444444444444244444444444400000000000000000000000000000000000000000000000000000000000000000000000000000000
1dd1d1d100000000445544444444444444444453b444444400000000000000000000000000000000000000000000000000000000000000000000000000000000
11d1d1d1000000004442444444445544444444bbbb34444d00000000000000000000000000000000000000000000000000000000000000000000000000000000
d1ddd11d000000004444444444444244444443bbbb34444400000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040404000000000000000000000000000005000000000000000000000000000080000000000000000000000000000000
__map__
e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c4c5c0e0e0e0e0c0e0e0c3c4c4c5e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2c2f2c4c4c4c4c5e0e0c3f3c2c2d5c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d4c2c2c2c2f4e4e5e0c0d3d4c2c2f2c4c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2c2c2c2f4e5e0e0e0e0e3e4f5c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2c2c2c2d5c0e0e0e0e0e0e0d3c2d4c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2c2c2f4e5e0e0e0e0e0e0c0d3c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2c2c2d5e0e0e0e0c1c1c1c4f3c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2f4e4e5e0e0c0e0d0d1d2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2d5c0e0e0e0e0e0e1e1e1f5c2c2d4c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c2f2c4c4c4c5e0e0e0e0e0e3e4f5c2c2c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e4e4e4e4e4e5e0e0e0e0e0e0e0e3e4e4c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e0e0e0e0e0e0c0e0e0e0e0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e0e0c0e0e0e0c0e0e0e0e0e0e0e0e0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e0e0e0e0e0e0e0e0e0e0e0e0e0c0e0e0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011f00201b2401324018240132401b2401324018240132401d2401324018240132401d2401324018240132401f2401324016240132401f24013240162411f2401d2401324016240132401d240132401b2401a240
011f00200c1640c1600c1600c1600c1600c1600c1600c160081640816008160081600816008160081600816003164031600316003160031600316003160031600216402160021600216002160021600216002160
011f00101b240132401b240132401b240132401b240132401d240132401d240132401d240132401d2401324000000000000000000000000000000000000000000000000000000000000000000000000000000000
011f00201824000000182400000018240000001824000000182400000018240000001824000000182400000016240000001624000000162400000016240000001624000000162400000016240000001624000000
011f00100f25013250152501d2501b2501625022250292500e25013250162501b2501a250162501a2501b25000000000000000000000000000000000000000000000000000000000000000000000000000000000
011f00101863318603186031863318633186031860300000186331863418633186331863300000000001860400000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400001854424542000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010500003003124031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010c00000c03130031000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010500003062330613000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01060000247510c751000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010300003072300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011600003037530365303553034530335303253031500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305
010e00001c6531c6331c6531c63300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 00014344
00 00014344
00 02030145
00 02030105
00 02030105
02 04050145
02 44454144
00 41424344
00 41424344
00 41424344
03 01424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

