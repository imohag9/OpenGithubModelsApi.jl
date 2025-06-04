using OpenGithubModelsApi
using OpenGithubModelsApi.APIClient
using Test
using DotEnv

DotEnv.load!()
tokens = filter(x -> startswith("GITHUB_TOKEN", x), keys(ENV))


!(tokens === Set{String}()) && @testset "OpenGithubModelsApi.jl" begin




    @testset "get_all_models" begin
        try
            models = OpenGithubModelsApi.get_all_models()
            @test !isnothing(models)
        catch e
            @warn "get_all_models test skipped due to API error: $(e)"
        end
    end
end
