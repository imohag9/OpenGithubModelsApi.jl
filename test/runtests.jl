using OpenGithubModelsApi
using Test
using Aqua
using OpenAPI
@testset "OpenGithubModelsApi.jl" begin
 # ======================
    # Code Quality Tests
    # ======================
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(OpenGithubModelsApi;
            ambiguities = true,
            project_extras = false,
            deps_compat = false,
            stale_deps = true,
            piracies = true,
            unbound_args = true
        )
    end
    
    # ======================
    # Client Initialization Tests
    # ======================
    @testset "Client Initialization" begin
        @testset "Valid client creation" begin
            client = GithubModelsClient("test_token")
            @test client.auth_token == "test_token"
            @test client.base_url == "https://models.github.ai"
            @test client.api_version == "2022-11-28"
            
            custom_client = GithubModelsClient("test_token", base_url="https://api.example.com", api_version="2023-01-01")
            @test custom_client.base_url == "https://api.example.com"
            @test custom_client.api_version == "2023-01-01"
        end
        
        @testset "Invalid URL handling" begin
            @test_throws ArgumentError GithubModelsClient("test_token", base_url="invalid_url")
        end
    end
    
    # ======================
    # Model Validation Tests
    # ======================
    @testset "Data Model Validation" begin
        @testset "Message Model" begin
            # Valid message
            valid_msg = Message(role="user", content="Hello")
            @test valid_msg.role == "user"
            @test valid_msg.content == "Hello"
            
            # Invalid role
            @test_throws OpenAPI.ValidationException Message(role="invalid", content="Hello")
            

            

            
            # Valid roles
            for role in ["assistant", "developer", "system", "user"]
                msg = Message(role=role, content="Test")
                @test msg.role == role
            end
        end
        
        @testset "InferenceRequest Model" begin
            # Basic valid request
            basic_request = InferenceRequest(
                model="openai/gpt-4.1",
                messages=[Message(role="user", content="Hello")]
            )
            @test basic_request.model == "openai/gpt-4.1"
            @test length(basic_request.messages) == 1
            

            

            
            # Valid temperature
            valid_request = InferenceRequest(
                model="openai/gpt-4.1",
                messages=[Message(role="user", content="Hello")],
                temperature=0.5
            )
            @test valid_request.temperature == 0.5
            
            # Invalid modalities
            @test_throws OpenAPI.ValidationException InferenceRequest(
                model="openai/gpt-4.1",
                messages=[Message(role="user", content="Hello")],
                modalities=["text", "invalid"]
            )
            
            # Valid modalities
            valid_modalities = InferenceRequest(
                model="openai/gpt-4.1",
                messages=[Message(role="user", content="Hello")],
                modalities=["text", "audio"]
            )
            @test valid_modalities.modalities == ["text", "audio"]
            
            # Invalid tool_choice
            @test_throws OpenAPI.ValidationException InferenceRequest(
                model="openai/gpt-4.1",
                messages=[Message(role="user", content="Hello")],
                tool_choice="invalid"
            )
            
            # Valid tool_choice
            for choice in ["auto", "required", "none"]
                request = InferenceRequest(
                    model="openai/gpt-4.1",
                    messages=[Message(role="user", content="Hello")],
                    tool_choice=choice
                )
                @test request.tool_choice == choice
            end
        end
        
        @testset "ModelData Model" begin
            # Basic model data
            model = ModelData(
                id="openai/gpt-4.1",
                name="GPT-4.1",
                publisher="openai",
                summary="Advanced language model",
                rate_limit_tier="standard",
                tags=["language", "completion"],
                supported_input_modalities=["text"],
                supported_output_modalities=["text"]
            )
            
            @test model.id == "openai/gpt-4.1"
            @test model.name == "GPT-4.1"
            @test model.publisher == "openai"
            @test model.summary == "Advanced language model"
            @test model.rate_limit_tier == "standard"
            @test model.tags == ["language", "completion"]
            @test model.supported_input_modalities == ["text"]
            @test model.supported_output_modalities == ["text"]
        end
    end
    

end
