
if !isdir("pluto_deploy_env")
     error("""
    Run me from the root of the repository directory, usage:
    julia pluto_deploy_env/generate_html.jl
    """)
end

using Pkg
Pkg.activate("./pluto_deploy_env")
Pkg.instantiate()
using PlutoSliderServer

cd("notebooks")
# all kwargs can be specified in PlutoDeployment.toml
export_directory()