

"""InferenceRequest_response_format

    InferenceRequestResponseFormat(;
        type=nothing,
        json_schema=nothing,
    )

    - type::String : The type of the response.
    - json_schema::Any : The JSON schema for the response.
"""
Base.@kwdef mutable struct InferenceRequestResponseFormat <: OpenAPI.APIModel
    type::Union{Nothing, String} = nothing
    json_schema::Union{Nothing, Any} = nothing

    function InferenceRequestResponseFormat(type, json_schema, )
        o = new(type, json_schema, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InferenceRequestResponseFormat

const _property_types_InferenceRequestResponseFormat = Dict{Symbol,String}(Symbol("type")=>"String", Symbol("json_schema")=>"Any", )
OpenAPI.property_type(::Type{ InferenceRequestResponseFormat }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InferenceRequestResponseFormat[name]))}

function OpenAPI.check_required(o::InferenceRequestResponseFormat)
    true
end

function OpenAPI.validate_properties(o::InferenceRequestResponseFormat)
    OpenAPI.validate_property(InferenceRequestResponseFormat, Symbol("type"), o.type)
    OpenAPI.validate_property(InferenceRequestResponseFormat, Symbol("json_schema"), o.json_schema)
end

function OpenAPI.validate_property(::Type{ InferenceRequestResponseFormat }, name::Symbol, val)

    if name === Symbol("type")
        OpenAPI.validate_param(name, "InferenceRequestResponseFormat", :enum, val, ["json_schema"])
    end


end
