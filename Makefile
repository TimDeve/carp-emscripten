.DEFAULT_GOAL := static/index.html

out/main.c: main.carp
	carp -b main.carp

static/index.html: out/main.c
	mkdir -p static
	emcc -Wno-everything -I${CARP_DIR}/core -s USE_SDL=2 -s WASM=1 -o static/index.html out/main.c
