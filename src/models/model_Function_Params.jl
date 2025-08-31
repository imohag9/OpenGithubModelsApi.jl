

@doc raw"""Function_Params

    Function_Params(;
        name=nothing,
        description=nothing,
        parameters=nothing,
    )

    - name::String : The name of the function to be called.
    - description::String : A description of what the function does. The model will use this description when selecting the function and interpreting its parameters.
    - parameters::A Json Object that describes the function params
"""
Base.@kwdef mutable struct Function_Params <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    description::Union{Nothing, String} = nothing
    parameters::Union{Nothing, Dict{String,String}} = nothing

    function Function_Params(name, description, parameters, )
        o = new(name, description, parameters, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type Function_Params

const _property_types_Function_Params = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("description")=>"String", Symbol("parameters")=>"Dict{String,String}", )
OpenAPI.property_type(::Type{ Function_Params }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_Function_Params[name]))}

function OpenAPI.check_required(o::Function_Params)
    true
end

function OpenAPI.validate_properties(o::Function_Params)
    OpenAPI.validate_property(Function_Params, Symbol("name"), o.name)
    OpenAPI.validate_property(Function_Params, Symbol("description"), o.description)
    OpenAPI.validate_property(Function_Params, Symbol("parameters"), o.parameters)
end

function OpenAPI.validate_property(::Type{ Function_Params }, name::Symbol, val)



end
