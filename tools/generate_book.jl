if !isdir("pluto_deploy_env")
    error("""
    Run me from the root of the repository directory, using:

    julia tools/generate_book.jl
    """)
end

if VERSION < v"1.6.0-aaa"
    @error "Our website needs to be generated with Julia 1.6. Go to julialang.org/downloads to install it."
end

import Pkg
Pkg.activate("./pluto_deploy_env")
Pkg.instantiate()


# Goals for this script:
# 1. Add Headers to each of the notebook with the correct styling and youtube video
# 2. Generate the md files for each notebook
# 3. Add all Chapters to sidebar
# Bonuses:
# - Hide markdown and html cell
# - Remove empty cells

using Pluto

# If we're running inside a github action, redirect Julia logs to the github UI

# using Logging: global_logger
# using GitHubActions: GitHubActionsLogger
# get(ENV, "GITHUB_ACTIONS", "false") == "true" && global_logger(GitHubActionsLogger())


struct Chapter
    number::Int
    name::String
end

struct Section
    chapter::Int
    section::Int
    name::String
    notebook_path::String
    #video_id::String
    #preview_image_url::String
end

without_dotjl(path) = splitext(path)[1]

"""
Generate the single-line .md file that embeds the static preview of the notebook. Franklin needs the .md file to exist to create a page.

This assumes that all path's are relative to the repo root and that we are writing to website/
"""
function write_md_page(path::String)
    file_name = basename(without_dotjl(path))
    outpath = "website/$file_name.md"
    write(outpath, "{{ plutonotebookpage  /notebooks/$file_name }}")
end

function process_book_item(section::Section)
    println(section.notebook_path)
    notebook  = Pluto.load_notebook_nobackup(section.notebook_path)
    ordered_cells = notebook.cells

    # First, add the header to each cell
    first_cell = ordered_cells[1]

    cells_dict = getfield(notebook, :cells_dict)
    cell_order = getfield(notebook, :cell_order)

    # Second hide all md, html cells
    for cell ∈ ordered_cells
        if startswith(cell.code, "html") || startswith(cell.code, "md")
            cell.code_folded = true
        end
    end

    setfield!(notebook, :cells_dict, cells_dict)
    setfield!(notebook, :cell_order, cell_order)

    # analyze the notebook so that cells are saved in the correct order
    notebook.topology = Pluto.updated_topology(notebook.topology, notebook, notebook.cells)
    Pluto.update_dependency_cache!(notebook)
    Pluto.save_notebook(notebook)

    # Now we need to generate the approriate .md file for this notebook
    write_md_page(section.notebook_path)
end

function process_book_item(ch::Chapter)
    # This is not a notebook so we don't need to do anything
end

book_model = [
    Section(1,1,"Basic", "notebooks/Basic.jl")
    Section(1,2,"Plots", "notebooks/plot.jl")
]

for section ∈ book_model
    process_book_item(section)
end
