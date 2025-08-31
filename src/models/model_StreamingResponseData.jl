

"""Streaming_Response_data
Some details about the response.

    StreamingResponseData(;
        choices=nothing,
    )

    - choices::Vector{StreamingResponseDataChoices}
"""
Base.@kwdef mutable struct StreamingResponseData <: OpenAPI.APIModel
    choices::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{StreamingResponseDataChoices} }

    function StreamingResponseData(choices, )
        o = new(choices, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type StreamingResponseData

const _property_types_StreamingResponseData = Dict{Symbol,String}(Symbol("choices")=>"Vector{StreamingResponseDataChoices}", )
OpenAPI.property_type(::Type{ StreamingResponseData }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_StreamingResponseData[name]))}

function OpenAPI.check_required(o::StreamingResponseData)
    true
end

function OpenAPI.validate_properties(o::StreamingResponseData)
    OpenAPI.validate_property(StreamingResponseData, Symbol("choices"), o.choices)
end

function OpenAPI.validate_property(::Type{ StreamingResponseData }, name::Symbol, val)

end
