

"""Streaming_Response_data_choices

    StreamingResponseDataChoices(;
        delta=nothing,
    )

    - delta::StreamingResponseDataDelta
"""
Base.@kwdef mutable struct StreamingResponseDataChoices <: OpenAPI.APIModel
    delta = nothing # spec type: Union{ Nothing, StreamingResponseDataDelta }

    function StreamingResponseDataChoices(delta, )
        o = new(delta, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type StreamingResponseDataChoices

const _property_types_StreamingResponseDataChoices = Dict{Symbol,String}(Symbol("delta")=>"StreamingResponseDataDelta", )
OpenAPI.property_type(::Type{ StreamingResponseDataChoices }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_StreamingResponseDataChoices[name]))}

function OpenAPI.check_required(o::StreamingResponseDataChoices)
    true
end

function OpenAPI.validate_properties(o::StreamingResponseDataChoices)
    OpenAPI.validate_property(StreamingResponseDataChoices, Symbol("delta"), o.delta)
end

function OpenAPI.validate_property(::Type{ StreamingResponseDataChoices }, name::Symbol, val)

end
