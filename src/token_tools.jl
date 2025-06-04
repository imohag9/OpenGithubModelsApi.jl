
using DotEnv


@doc raw"""
    get_api_key(; suffix::String="")

Gets the API key from the environment variables.

# Arguments
- `suffix::String`: Suffix for the API key environment variable.

# Returns
- `String`: The API key.

# Throws
- `Error`: If the API key environment variable is not set.
"""
function get_api_key(;suffix::String="")
    DotEnv.load!()
    user_key = "GITHUB_TOKEN"*suffix
    api_key = get(ENV,user_key , "")
    if isempty(api_key)
        error("$(user_key) environment variable not set.")
    end
    return api_key
end