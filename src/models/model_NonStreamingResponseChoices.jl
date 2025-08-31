

"""Non_Streaming_Response_choices

    NonStreamingResponseChoices(;
        message=nothing,
    )

    - message::NonStreamingResponseMessage
"""
Base.@kwdef mutable struct NonStreamingResponseChoices <: OpenAPI.APIModel
    message = nothing # spec type: Union{ Nothing, NonStreamingResponseMessage }

    function NonStreamingResponseChoices(message, )
        o = new(message, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type NonStreamingResponseChoices

const _property_types_NonStreamingResponseChoices = Dict{Symbol,String}(Symbol("message")=>"NonStreamingResponseMessage", )
OpenAPI.property_type(::Type{ NonStreamingResponseChoices }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_NonStreamingResponseChoices[name]))}

function OpenAPI.check_required(o::NonStreamingResponseChoices)
    true
end

function OpenAPI.validate_properties(o::NonStreamingResponseChoices)
    OpenAPI.validate_property(NonStreamingResponseChoices, Symbol("message"), o.message)
end

function OpenAPI.validate_property(::Type{ NonStreamingResponseChoices }, name::Symbol, val)

end
