# Largely based on the build from the pengbot irc bot

LUA_VERSION=5.4.4

run: ; ./fennel run.fnl 

gos-bin: main.fnl socket.a mime.a lua-$(LUA_VERSION)/src/liblua.a
	./fennel --compile-binary $< $@ \
		lua-$(LUA_VERSION)/src/liblua.a lua-$(LUA_VERSION)/src \
		--native-module socket.a --native-module mime.a

# dependencies: lua and luasocket

lua-$(LUA_VERSION): ; curl https://www.lua.org/ftp/lua-$(LUA_VERSION).tar.gz | tar xzf /dev/stdin
lua-$(LUA_VERSION)/src/liblua.a: lua-$(LUA_VERSION)
	make -C $^

luasocket:
	git clone https://github.com/diegonehab/luasocket
	git -C luasocket checkout v3.0.0

SOCKET_OBJS= \
	luasocket/src/luasocket.o \
	luasocket/src/timeout.o \
	luasocket/src/buffer.o \
	luasocket/src/io.o \
	luasocket/src/auxiliar.o \
	luasocket/src/compat.o \
	luasocket/src/options.o \
	luasocket/src/inet.o \
	luasocket/src/except.o \
	luasocket/src/select.o \
	luasocket/src/tcp.o \
	luasocket/src/udp.o \
	luasocket/src/usocket.o # <- this one should be wsocket.o for Windows

luasocket/src/%.o: luasocket lua-$(LUA_VERSION)
	make -C luasocket/src linux install MYCFLAGS=-static \
		LUAV=5.4 DESTDIR=$(PWD) LUAINC_linux=$(PWD)/lua-$(LUA_VERSION)/src

socket.a: $(SOCKET_OBJS)
	ar rcs $@ $^

mime.a: luasocket/src/mime.o luasocket/src/compat.o
	ar rcs $@ $^

# misc

clean:
	rm -f gos-bin mime.a socket.a
	make -C luasocket clean
	make -C lua-$(LUA_VERSION) clean

.PHONY: run clean
