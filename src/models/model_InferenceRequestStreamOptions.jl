

@doc raw"""InferenceRequest_stream_options

    InferenceRequestStreamOptions(;
        include_usage=false,
    )

    - include_usage::Bool : Whether to include usage information in the response.
"""
Base.@kwdef mutable struct InferenceRequestStreamOptions <: OpenAPI.APIModel
    include_usage::Union{Nothing, Bool} = false

    function InferenceRequestStreamOptions(include_usage, )
        o = new(include_usage, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InferenceRequestStreamOptions

const _property_types_InferenceRequestStreamOptions = Dict{Symbol,String}(Symbol("include_usage")=>"Bool", )
OpenAPI.property_type(::Type{ InferenceRequestStreamOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InferenceRequestStreamOptions[name]))}

function OpenAPI.check_required(o::InferenceRequestStreamOptions)
    true
end

function OpenAPI.validate_properties(o::InferenceRequestStreamOptions)
    OpenAPI.validate_property(InferenceRequestStreamOptions, Symbol("include_usage"), o.include_usage)
end

function OpenAPI.validate_property(::Type{ InferenceRequestStreamOptions }, name::Symbol, val)

end
