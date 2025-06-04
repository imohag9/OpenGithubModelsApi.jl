
@doc raw"""
    org_inference_req(request::InferenceRequest, org::String; verbose::Bool=false, token_suffix::String="")

Creates a chat completion for a given organization.

# Arguments
- `request::InferenceRequest`: The inference request.
- `org::String`: The organization name.
- `verbose::Bool`: Whether to return the full result or just the content.
- `token_suffix::String`: Suffix for the API key environment variable.

# Returns
- `Any`: The inference response.
"""
function org_inference_req(request::InferenceRequest, org::String;verbose::Bool=false,token_suffix::String="")
    try
        api_key = get_api_key(suffix=token_suffix)
        result = APIClient.create_org_chat_completion(GithubModels_API, org, api_key, GithubApiVersion, request)
        response = verbose ?  result : result[1].choices[1].message.content
        return response

    catch e
        return e
    end
end

export org_inference_req


@doc raw"""
    inference_req(request::InferenceRequest; verbose::Bool=false, token_suffix::String="")

Creates a chat completion.

# Arguments
- `request::InferenceRequest`: The inference request.
- `verbose::Bool`: Whether to return the full result or just the content.
- `token_suffix::String`: Suffix for the API key environment variable.

# Returns
- `Any`: The inference response.
"""
function inference_req(request::InferenceRequest;verbose::Bool=false,token_suffix::String="")
    try
        api_key = get_api_key(suffix=token_suffix)
        result = APIClient.create_chat_completion(GithubModels_API, api_key, GithubApiVersion,request)
        isnothing(result[1]) && return error("$(result[2][1]).message")
        response = verbose ?  result :  result[1].choices[1].message.content
        return response
    catch e
        return e
    end
end

export inference_req

@doc raw"""
    get_all_models(; token_suffix::String="")

Lists all available models.

# Arguments
- `token_suffix::String`: Suffix for the API key environment variable.

# Returns
- `Vector{ModelData}`: A vector of available models.
"""
function get_all_models(;token_suffix::String="")
    try
        api_key = get_api_key(suffix=token_suffix)
        result = APIClient.list_models(GithubModels_API, api_key, GithubApiVersion)
        return result[1]
    catch e
        return e.msg
    end
end

export get_all_models

