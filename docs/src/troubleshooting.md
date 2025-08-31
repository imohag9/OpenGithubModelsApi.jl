```@meta
CurrentModule = OpenGithubModelsApi
```
# Troubleshooting

This section covers common issues and their solutions when using the OpenGithubModelsApi.jl package.

## Common Errors

### Authentication Errors

**Symptom**: `401 Unauthorized` errors

**Solution**:
- Verify your GitHub token has the necessary permissions
- Check that the token hasn't expired
- Ensure you're using the correct token format (`ghp_...`)

### Invalid Model ID Format

**Symptom**: Error about model ID format

**Solution**:
- Model IDs must be in the format `{publisher}/{model_name}`
- Verify the model exists using `get_all_models()`
- Check for typos in the model ID

### Parameter Validation Errors

**Symptom**: Errors about invalid parameters

**Common issues**:
- Temperature outside 0-1 range
- Invalid message roles
- Unsupported modalities

**Solution**:
- Check parameter constraints in the documentation
- Validate inputs before making API calls
- Use the type-safe constructors to catch errors early

### Streaming Not Supported

**Symptom**: "Error: Streaming Not Supported" message

**Solution**:
- This package does not support streaming responses
- Set `stream=false` or omit the parameter (default is false)

## Debugging Tips

### Enable Verbose Mode

For more detailed response information:

```julia
response = create_chat_completion(client, request, verbose=true)
```

### Inspect Model Data

To understand available models:

```julia
models = get_all_models(client)
for model in models
    println("Model ID: $(model.id)")
    println("Supported input modalities: $(model.supported_input_modalities)")
    println("Supported output modalities: $(model.supported_output_modalities)")
    println("---")
end
```

### Validate Request Before Sending

```julia
try
    # This will validate the request structure
    request = InferenceRequest(
        model="openai/gpt-4.1",
        messages=[Message(role="user", content="Hello")],
        temperature=0.5
    )
    # If we get here, the request is valid
    response = create_chat_completion(client, request)
catch e
    println("Request validation failed: $e")
end
```

## Frequently Asked Questions

### Q: Why am I getting "Invalid message role" errors?

**A**: Message roles must be one of: "assistant", "developer", "system", or "user". Check your message definitions for typos.

### Q: Can I use streaming responses with this package?

**A**: No, streaming responses are explicitly not supported by this package. Attempting to set `stream=true` will result in an error.

### Q: How do I find available models?

**A**: Use the `get_all_models(client)` function to retrieve a list of all available models with their metadata.

### Q: What's the difference between `create_chat_completion` and `org_create_chat_completion`?

**A**: `org_create_chat_completion` is for organization-scoped requests and requires an additional organization name parameter, while `create_chat_completion` is for standard requests.

## Reporting Issues

If you encounter problems that aren't covered here:

1. Check the [GitHub issues page](https://github.com/imohag9/OpenGithubModelsApi.jl/issues)
2. Include:
   - Package version
   - Julia version
   - Code snippet that reproduces the issue
   - Full error message
3. Open a new issue with the details

```@raw html
<div class="admonition tip">
  <p class="admonition-title">Tip</p>
  <p>When reporting issues, include the output of <code>versioninfo()</code> and the package status to help diagnose the problem.</p>
</div>
```