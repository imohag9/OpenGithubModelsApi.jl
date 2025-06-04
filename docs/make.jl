using OpenGithubModelsApi
using Documenter

DocMeta.setdocmeta!(OpenGithubModelsApi, :DocTestSetup, :(using OpenGithubModelsApi); recursive=true)

makedocs(;
    modules=[OpenGithubModelsApi],
    authors="imohag9 <souidi.hamza90@gmail.com> and contributors",
    sitename="OpenGithubModelsApi.jl",
    format=Documenter.HTML(;
        canonical="https://imohag9.github.io/OpenGithubModelsApi.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/imohag9/OpenGithubModelsApi.jl",
    devbranch="main",
)
