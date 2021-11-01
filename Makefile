.phony : all, build, franklin, web, clean

all: build

build:
	julia -e 'using Pkg; Pkg.instantiate()'

franklin:
	julia -e 'using Franklin; serve()'

web:
	julia tools/generate_html.jl
	julia tools/generate_book.jl

clean:
	-rm -f Manifest.toml
	-rm -f pluto_deploy_env/Manifest.toml
	-rm -rf website/**
	-rm -rf __site
