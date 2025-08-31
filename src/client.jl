using URIs
struct GithubModelsClient
    auth_token::String
    base_url::String

    api_version::String
    _api::OpenAPI.Clients.Client

    function GithubModelsClient(
            auth_token::String; base_url::String = "https://models.github.ai",
            api_version::String = "2022-11-28")


        url = URI(base_url);
        URIs.isvalid(url);
        _api = OpenAPI.Clients.Client(base_url)
        new(auth_token, base_url, api_version, _api)
    end
end
Base.show(io::IO, ::MIME"text/plain", c::GithubModelsClient) = print(io, c._api)

export GithubModelsClient