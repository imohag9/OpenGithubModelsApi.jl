

"""Non_Streaming_Response_message
The message associated with the completion.

    NonStreamingResponseMessage(;
        content=nothing,
        role=nothing,
    )

    - content::String : The content of the message.
    - role::String : The role of the message.
"""
Base.@kwdef mutable struct NonStreamingResponseMessage <: OpenAPI.APIModel
    content::Union{Nothing, String} = nothing
    role::Union{Nothing, String} = nothing

    function NonStreamingResponseMessage(content, role, )
        o = new(content, role, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type NonStreamingResponseMessage

const _property_types_NonStreamingResponseMessage = Dict{Symbol,String}(Symbol("content")=>"String", Symbol("role")=>"String", )
OpenAPI.property_type(::Type{ NonStreamingResponseMessage }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_NonStreamingResponseMessage[name]))}

function OpenAPI.check_required(o::NonStreamingResponseMessage)
    true
end

function OpenAPI.validate_properties(o::NonStreamingResponseMessage)
    OpenAPI.validate_property(NonStreamingResponseMessage, Symbol("content"), o.content)
    OpenAPI.validate_property(NonStreamingResponseMessage, Symbol("role"), o.role)
end

function OpenAPI.validate_property(::Type{ NonStreamingResponseMessage }, name::Symbol, val)


end
