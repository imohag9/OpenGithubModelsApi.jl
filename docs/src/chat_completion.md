```@meta
CurrentModule = OpenGithubModelsApi
```
# Chat Completion API

The chat completion API allows you to interact with GitHub's AI models through a conversational interface.

## Basic Chat Completion

```@docs
create_chat_completion
```

### Simple Example

```julia
using OpenGithubModelsApi

# Create a client (using a placeholder token for documentation)
client = GithubModelsClient("ghp_example_token")

# Create a message history
messages = [
    Message(role="system", content="You are a helpful assistant"),
    Message(role="user", content="What is Julia programming language?")
]

# Create an inference request
request = InferenceRequest(
    model="openai/gpt-4.1",  # Example model ID
    messages=messages,
    temperature=0.7
)

# Get a response (returns just the content by default)
response = create_chat_completion(client, request)
println(response)
```

## Request Parameters

### Required Parameters

- `model`: ID of the specific model to use (format: `{publisher}/{model_name}`)
- `messages`: Array of message objects with `role` and `content`

### Optional Parameters

```@docs
InferenceRequest
```

## Message Structure

```@docs
Message
```

Valid message roles are:
- `"system"`: For system instructions
- `"user"`: For user messages
- `"assistant"`: For assistant responses
- `"developer"`: For developer-specific messages

## Advanced Usage

### Getting Full Response Details

By default, `create_chat_completion` returns just the content string. To get the full response object, use `verbose=true`:

```julia
full_response = create_chat_completion(client, request, verbose=true)
```

### Controlling Response Length and Creativity

```julia
request = InferenceRequest(
    model="openai/gpt-4.1",
    messages=messages,
    temperature=0.3,      # More deterministic (0.0-1.0)
    max_tokens=100,       # Limit response length
    top_p=0.9             # Alternative to temperature
)
```

## Error Handling

Common errors include:
- Invalid model ID format
- Invalid message roles
- Parameter validation errors (e.g., temperature outside 0-1 range)
- API rate limits

```@raw html
<div class="admonition warning">
  <p class="admonition-title">Warning</p>
  <p>Streaming responses are not supported by this package. Setting <code>stream=true</code> will result in an error.</p>
</div>
```

## Best Practices

- Always include a system message to guide the model's behavior
- Keep conversation history within the model's context window
- Adjust temperature based on your use case (lower for factual responses, higher for creative tasks)
- Validate inputs before making API calls