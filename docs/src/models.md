```@meta
CurrentModule = OpenGithubModelsApi
```
# Model Catalog

The model catalog API allows you to discover and understand available AI models.

## Listing Available Models

```@docs
get_all_models
```

### Basic Usage

```@example models
using OpenGithubModelsApi

# Create a client (using a placeholder token for documentation)
client = GithubModelsClient("ghp_example_token")

# Get all available models
models = get_all_models(client)

# Print model information
for model in models
    println("Model: $(model.name) (ID: $(model.id))")
    println("Publisher: $(model.publisher)")
    println("Summary: $(model.summary)")
    println("---")
end
```

## Model Data Structure

```@docs
ModelData
```

### Key Model Properties

- `id`: Unique model identifier (format: `{publisher}/{model_name}`)
- `name`: Human-readable model name
- `publisher`: Organization or individual who published the model
- `summary`: Brief description of the model's capabilities
- `rate_limit_tier`: Rate limiting tier for the model
- `tags`: Categorization tags for the model
- `supported_input_modalities`: Input formats the model accepts
- `supported_output_modalities`: Output formats the model produces

## Filtering Models

While the API returns all available models, you can filter them in Julia:

```julia
# Get only text models
text_models = filter(m -> "text" in m.supported_input_modalities, models)

# Get models from a specific publisher
openai_models = filter(m -> m.publisher == "openai", models)
```

## Model Selection Guidance

When selecting a model, consider:

- The input and output modalities you need
- The model's capabilities as described in the summary
- The rate limit tier for your expected usage volume
- The publisher's reputation and support

```@raw html
<div class="admonition tip">
  <p class="admonition-title">Tip</p>
  <p>Check the model's supported modalities to ensure compatibility with your application's requirements.</p>
</div>
```

## Best Practices

- Cache model listings to reduce API calls
- Validate model IDs before using them in requests
- Handle cases where expected models might not be available
- Consider creating a model registry for your application