

"""InferenceResponse

    InferenceResponse(;
        choices=nothing,
        data=nothing,
    )

    - choices::Vector{NonStreamingResponseChoices}
    - data::StreamingResponseData
"""
Base.@kwdef mutable struct InferenceResponse <: OpenAPI.APIModel
    choices::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{NonStreamingResponseChoices} }
    data = nothing # spec type: Union{ Nothing, StreamingResponseData }

    function InferenceResponse(choices, data, )
        o = new(choices, data, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InferenceResponse

const _property_types_InferenceResponse = Dict{Symbol,String}(Symbol("choices")=>"Vector{NonStreamingResponseChoices}", Symbol("data")=>"StreamingResponseData", )
OpenAPI.property_type(::Type{ InferenceResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InferenceResponse[name]))}

function OpenAPI.check_required(o::InferenceResponse)
    true
end

function OpenAPI.validate_properties(o::InferenceResponse)
    OpenAPI.validate_property(InferenceResponse, Symbol("choices"), o.choices)
    OpenAPI.validate_property(InferenceResponse, Symbol("data"), o.data)
end

function OpenAPI.validate_property(::Type{ InferenceResponse }, name::Symbol, val)


end
