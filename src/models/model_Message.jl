

"""InferenceRequest_messages_inner

    Message(;
        role=nothing,
        content=nothing,
    )

    - role::String : The chat role associated with this message
    - content::String : The content of the message
"""
Base.@kwdef mutable struct Message <: OpenAPI.APIModel
    role::Union{Nothing, String} = nothing
    content::Union{Nothing, String} = nothing

    function Message(role, content, )
        o = new(role, content, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type Message

const _property_types_Message = Dict{Symbol,String}(Symbol("role")=>"String", Symbol("content")=>"String", )
OpenAPI.property_type(::Type{ Message }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_Message[name]))}

function OpenAPI.check_required(o::Message)
    o.role === nothing && (return false)
    o.content === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::Message)
    OpenAPI.validate_property(Message, Symbol("role"), o.role)
    OpenAPI.validate_property(Message, Symbol("content"), o.content)
end

function OpenAPI.validate_property(::Type{ Message }, name::Symbol, val)

    if name === Symbol("role")
        OpenAPI.validate_param(name, "Message", :enum, val, ["assistant", "developer", "system", "user"])
    end


end
