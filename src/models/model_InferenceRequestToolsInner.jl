

"""InferenceRequest_tools_inner

    InferenceRequestToolsInner(;
        call_function=nothing,
        type=nothing,
    )

    - call_function::Function_Params
    - type::String
"""
Base.@kwdef mutable struct InferenceRequestToolsInner <: OpenAPI.APIModel
    call_function = nothing # spec type: Union{ Nothing, Function_Params }
    type::Union{Nothing, String} = nothing

    function InferenceRequestToolsInner(call_function, type, )
        o = new(call_function, type, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InferenceRequestToolsInner

const _property_types_InferenceRequestToolsInner = Dict{Symbol,String}(Symbol("function")=>"Function_Params", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ InferenceRequestToolsInner }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InferenceRequestToolsInner[name]))}

function OpenAPI.check_required(o::InferenceRequestToolsInner)
    true
end

function OpenAPI.validate_properties(o::InferenceRequestToolsInner)
    OpenAPI.validate_property(InferenceRequestToolsInner, Symbol("function"), o.call_function)
    OpenAPI.validate_property(InferenceRequestToolsInner, Symbol("type"), o.type)
end

function OpenAPI.validate_property(::Type{ InferenceRequestToolsInner }, name::Symbol, val)


    if name === Symbol("type")
        OpenAPI.validate_param(name, "InferenceRequestToolsInner", :enum, val, ["function"])
    end

end
