# $Id: Makefile,v 1.3 2007/10/29 22:50:16 carregal Exp $

# Default prefix
PREFIX = /usr/local

# System's lua directory (where Lua libraries are installed)
LUA_DIR= $(PREFIX)/share/lua/5.1

# Lua interpreter
LUA=lua

install:
	mkdir -p $(LUA_DIR)/copas
	cp src/copas.lua $(LUA_DIR)/copas.lua
	cp src/copas/ftp.lua $(LUA_DIR)/copas/ftp.lua
	cp src/copas/smtp.lua $(LUA_DIR)/copas/smtp.lua
	cp src/copas/http.lua $(LUA_DIR)/copas/http.lua
	cp src/copas/limit.lua $(LUA_DIR)/copas/limit.lua

test:
	cd tests; $(LUA) -lluacov largetransfer.lua
	cd tests; $(LUA) -lluacov testhttp.lua
	cd tests; $(LUA) -lluacov testhttps.lua
	cd tests; luacov copas
	cd tests; cat luacov.report.out

clean:
