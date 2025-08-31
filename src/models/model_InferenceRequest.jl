
""" InferenceRequest

    InferenceRequest(;
        model=nothing,
        messages=nothing,
        frequency_penalty=nothing,
        max_tokens=nothing,
        modalities=nothing,
        presence_penalty=nothing,
        response_format=nothing,
        seed=nothing,
        stream=false,
        stream_options=nothing,
        stop=nothing,
        temperature=nothing,
        tool_choice=nothing,
        tools=nothing,
        top_p=nothing,
    )

    - model::String : ID of the specific model to use for the request.
    - messages::Vector{Message} : The collection of context messages associated with this chat completion request. Typical usage begins with a chat message for the System role that provides instructions for the behavior of the assistant, followed by alternating messages between the User and Assistant roles.
    - frequency_penalty::Float64 : A value that influences the probability of generated tokens appearing based on their cumulative frequency in generated text. Positive values will make tokens less likely to appear as their frequency increases and decrease the likelihood of the model repeating the same statements verbatim. Supported range is [-2, 2].
    - max_tokens::Int64 : The maximum number of tokens to generate in the completion. The token count of your prompt plus max_tokens cannot exceed the model&#39;s context length. For example, if your prompt is 100 tokens and you set max_tokens to 50, the API will return a completion with a maximum of 50 tokens.
    - modalities::Vector{String} : The modalities that the model is allowed to use for the chat completions response. The default modality is text. Indicating an unsupported modality combination results in a 422 error. Supported values are: text, audio 
    - presence_penalty::Float64 : A value that influences the probability of generated tokens appearing based on their existing presence in generated text. Positive values will make tokens less likely to appear when they already exist and increase the model&#39;s likelihood to output new tokens. Supported range is [-2, 2].
    - response_format::InferenceRequestResponseFormat
    - seed::Int64 : If specified, the system will make a best effort to sample deterministically such that repeated requests with the same seed and parameters should return the same result. Determinism is not guaranteed.
    - stream::Bool : A value indicating whether chat completions should be streamed for this request.
    - stream_options::InferenceRequestStreamOptions
    - stop::Vector{String} : A collection of textual sequences that will end completion generation.
    - temperature::Float64 : The sampling temperature to use that controls the apparent creativity of generated completions. Higher values will make output more random while lower values will make results more focused and deterministic. It is not recommended to modify temperature and top_p for the same completion request as the interaction of these two settings is difficult to predict. Supported range is [0, 1]. Decimal values are supported.
    - tool_choice::String : If specified, the model will configure which of the provided tools it can use for the chat completions response.
    - tools::Vector{InferenceRequestToolsInner} : A list of tools the model may request to call. Currently, only functions are supported as a tool. The model may respond with a function call request and provide the input arguments in JSON format for that function.
    - top_p::Float64 : An alternative to sampling with temperature called nucleus sampling. This value causes the model to consider the results of tokens with the provided probability mass. As an example, a value of 0.15 will cause only the tokens comprising the top 15% of probability mass to be considered. It is not recommended to modify temperature and top_p for the same request as the interaction of these two settings is difficult to predict. Supported range is [0, 1]. Decimal values are supported.
"""
Base.@kwdef mutable struct InferenceRequest <: OpenAPI.APIModel
    model::Union{Nothing, String} = nothing
    messages::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{Message} }
    frequency_penalty::Union{Nothing, Float64} = nothing
    max_tokens::Union{Nothing, Int64} = nothing
    modalities::Union{Nothing, Vector{String}} = nothing
    presence_penalty::Union{Nothing, Float64} = nothing
    response_format = nothing # spec type: Union{ Nothing, InferenceRequestResponseFormat }
    seed::Union{Nothing, Int64} = nothing
    stream::Union{Nothing, Bool} = false
    stream_options = nothing # spec type: Union{ Nothing, InferenceRequestStreamOptions }
    stop::Union{Nothing, Vector{String}} = nothing
    temperature::Union{Nothing, Float64} = nothing
    tool_choice::Union{Nothing, String} = nothing
    tools::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{InferenceRequestToolsInner} }
    top_p::Union{Nothing, Float64} = nothing

    function InferenceRequest(model, messages, frequency_penalty, max_tokens, modalities, presence_penalty, response_format, seed, stream, stream_options, stop, temperature, tool_choice, tools, top_p, )
        o = new(model, messages, frequency_penalty, max_tokens, modalities, presence_penalty, response_format, seed, stream, stream_options, stop, temperature, tool_choice, tools, top_p, )
        OpenAPI.validate_properties(o)
        return o
    end
end # type InferenceRequest

const _property_types_InferenceRequest = Dict{Symbol,String}(Symbol("model")=>"String", Symbol("messages")=>"Vector{Message}", Symbol("frequency_penalty")=>"Float64", Symbol("max_tokens")=>"Int64", Symbol("modalities")=>"Vector{String}", Symbol("presence_penalty")=>"Float64", Symbol("response_format")=>"InferenceRequestResponseFormat", Symbol("seed")=>"Int64", Symbol("stream")=>"Bool", Symbol("stream_options")=>"InferenceRequestStreamOptions", Symbol("stop")=>"Vector{String}", Symbol("temperature")=>"Float64", Symbol("tool_choice")=>"String", Symbol("tools")=>"Vector{InferenceRequestToolsInner}", Symbol("top_p")=>"Float64", )
OpenAPI.property_type(::Type{ InferenceRequest }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InferenceRequest[name]))}

function OpenAPI.check_required(o::InferenceRequest)
    o.model === nothing && (return false)
    o.messages === nothing && (return false)
    true
end

function OpenAPI.validate_properties(o::InferenceRequest)
    OpenAPI.validate_property(InferenceRequest, Symbol("model"), o.model)
    OpenAPI.validate_property(InferenceRequest, Symbol("messages"), o.messages)
    OpenAPI.validate_property(InferenceRequest, Symbol("frequency_penalty"), o.frequency_penalty)
    OpenAPI.validate_property(InferenceRequest, Symbol("max_tokens"), o.max_tokens)
    OpenAPI.validate_property(InferenceRequest, Symbol("modalities"), o.modalities)
    OpenAPI.validate_property(InferenceRequest, Symbol("presence_penalty"), o.presence_penalty)
    OpenAPI.validate_property(InferenceRequest, Symbol("response_format"), o.response_format)
    OpenAPI.validate_property(InferenceRequest, Symbol("seed"), o.seed)
    OpenAPI.validate_property(InferenceRequest, Symbol("stream"), o.stream)
    OpenAPI.validate_property(InferenceRequest, Symbol("stream_options"), o.stream_options)
    OpenAPI.validate_property(InferenceRequest, Symbol("stop"), o.stop)
    OpenAPI.validate_property(InferenceRequest, Symbol("temperature"), o.temperature)
    OpenAPI.validate_property(InferenceRequest, Symbol("tool_choice"), o.tool_choice)
    OpenAPI.validate_property(InferenceRequest, Symbol("tools"), o.tools)
    OpenAPI.validate_property(InferenceRequest, Symbol("top_p"), o.top_p)
end

function OpenAPI.validate_property(::Type{ InferenceRequest }, name::Symbol, val)





    if name === Symbol("modalities")
        OpenAPI.validate_param(name, "InferenceRequest", :enum, val, ["text", "audio"])
    end









    if name === Symbol("tool_choice")
        OpenAPI.validate_param(name, "InferenceRequest", :enum, val, ["auto", "required", "none"])
    end



end
