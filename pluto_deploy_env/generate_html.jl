using PlutoSliderServer

if !isdir("pluto_deploy_env")
     error("""
    Run me from the root of the repository directory, usage:
    julia pluto_deploy_env/generate_html.jl
    """)
end

cd("notebooks")
export_directory(Export_cache_dir="../__cache")