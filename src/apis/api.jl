const STATUS_SUCCESS = 200
const _returntypes_create_chat_completion = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => InferenceResponse,
)

function _oacinternal_create_chat_completion(client::GithubModelsClient, inference_request::InferenceRequest)
    _ctx = OpenAPI.Clients.Ctx(client._api, "POST", _returntypes_create_chat_completion, "/inference/chat/completions", [], inference_request)
    OpenAPI.Clients.set_param(_ctx.header, "Authorization", "Bearer $(client.auth_token)")  
    OpenAPI.Clients.set_param(_ctx.header, "X-GitHub-Api-Version", client.api_version)  
    OpenAPI.Clients.set_header_accept(_ctx, ["application/vnd.github+json", ])
    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json", ] )
    return _ctx
end

"""Creates a chat completion.

Params:
- auth_token::String (required)
- api_version::String (required)
- inference_request::InferenceRequest (required)

Return: InferenceResponse, OpenAPI.Clients.ApiResponse
"""
function create_chat_completion(client::GithubModelsClient, inference_request::InferenceRequest;verbose::Bool=false)
    _ctx = _oacinternal_create_chat_completion(client, inference_request)
    if inference_request.stream === true
        error( "Error: Streaming Not Supported ")
    end
    try
            result = OpenAPI.Clients.exec(_ctx)
            if result[2].status ≠ STATUS_SUCCESS
                error("$(result[2].message) \n Make sure you created a valid request and/or a valid Auth Token")
            else
                verbose && return result[1]
                if isa(result[1],InferenceResponse)
                    return result[1].choices.message.content
                else
                return result[1].message.content
                end
            
                
                return response
            end

        catch e
            if e isa OpenAPI.Clients.ApiException
                error("$(e.error.message) \nVerify your connection\n")
            else
                rethrow()
            end
        end

end


const _returntypes_create_org_chat_completion = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => InferenceResponse,
)

function _oacinternal_create_org_chat_completion(client::GithubModelsClient, org::String, inference_request::InferenceRequest)
    _ctx = OpenAPI.Clients.Ctx(client._api, "POST", _returntypes_create_org_chat_completion, "/orgs/{org}/inference/chat/completions", [], inference_request)
    OpenAPI.Clients.set_param(_ctx.path, "org", org)  
    OpenAPI.Clients.set_param(_ctx.header, "Authorization", "Bearer $(client.auth_token)")  
    OpenAPI.Clients.set_param(_ctx.header, "X-GitHub-Api-Version", client.api_version)  
    OpenAPI.Clients.set_header_accept(_ctx, ["application/vnd.github+json", ])
    OpenAPI.Clients.set_header_content_type(_ctx, ["application/json", ] )
    return _ctx
end

"""Creates a chat completion for a given organization.

Params:
- org::String (required)
- auth_token::String (required)
- api_version::String (required)
- inference_request::InferenceRequest (required)

Return: InferenceResponse, OpenAPI.Clients.ApiResponse
"""
function create_org_chat_completion(client::GithubModelsClient, org::String, inference_request::InferenceRequest;verbose::Bool=false)

    _ctx = _oacinternal_create_org_chat_completion(client, org, inference_request)
    inference_request.stream === true && return error("Error: Streaming Not Supported ")

    if inference_request.stream === true
        error( "Error: Streaming Not Supported ")
    end
    try
            result = OpenAPI.Clients.exec(_ctx)
            if result[2].status ≠ STATUS_SUCCESS
                error("$(result[2].message) \n Make sure you created a valid request and/or a valid Auth Token")

            else
                verbose && return result[1]
                if isa(result[1],InferenceResponse)
                    return result[1].choices.message.content
                else
                return result[1].message.content
                end
            
                
                return response
            end

        catch e
            if e isa OpenAPI.Clients.ApiException
                error("$(e.error.message) \nVerify your connection\n")
            else
                rethrow()
            end
        end
end



const _returntypes_list_models = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => Vector{ModelData},
)

function _oacinternal_list_models(client::GithubModelsClient)
    _ctx = OpenAPI.Clients.Ctx(client._api, "GET", _returntypes_list_models, "/catalog/models", [])
    OpenAPI.Clients.set_param(_ctx.header, "Authorization", "Bearer $(client.auth_token)")  
    OpenAPI.Clients.set_param(_ctx.header, "X-GitHub-Api-Version", client.api_version)  
    OpenAPI.Clients.set_header_accept(_ctx, ["application/vnd.github+json", ])
    OpenAPI.Clients.set_header_content_type(_ctx, [])
    return _ctx
end

"""Lists available models.

Params:
- auth_token::String (required)
- api_version::String (required)

Return: Vector{ModelData}, OpenAPI.Clients.ApiResponse
"""
function list_models(client::GithubModelsClient)
    _ctx = _oacinternal_list_models(client)
    try
            result = OpenAPI.Clients.exec(_ctx)
            if result[2].status ≠ STATUS_SUCCESS
                error("$(result[2].message) \n Make sure you created a valid request and/or a valid Auth Token")
            else
                return result[1]

            end

        catch e
            if e isa OpenAPI.Clients.ApiException
                error("$(e.error.message) \nVerify your connection\n")
            else
                rethrow()
            end
        end
end

export create_chat_completion
export create_org_chat_completion
export list_models
