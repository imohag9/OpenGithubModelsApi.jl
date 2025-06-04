module OpenGithubModelsApi
using OpenAPI

include("APIClient.jl")
using .APIClient

include("token_tools.jl")

include("completions.jl")


const CLIENT = OpenAPI.Clients.Client(APIClient.basepath(APIClient.DefaultApi))
const GithubModels_API = APIClient.DefaultApi(CLIENT)
const GithubApiVersion = "2022-11-28"


end
