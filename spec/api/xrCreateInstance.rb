# This is free and unencumbered software released into the public domain.

require 'openxr'

include OpenXR::API

RSpec.describe "xrCreateInstance" do
  before(:each) do
    @request = XrInstanceCreateInfo.new
    @request[:base][:type] = XR_TYPE_INSTANCE_CREATE_INFO
    @request[:base][:next] = nil
    @request[:createFlags] = 0
    @request[:applicationInfo][:applicationName] = "RSpec"
    @request[:applicationInfo][:applicationVersion] = 1
    @request[:applicationInfo][:engineName] = "RSpec"
    @request[:applicationInfo][:engineVersion] = 0
    @request[:applicationInfo][:apiVersion] = XR_CURRENT_API_VERSION
    @response = XrInstance.new
  end

  describe "when validating implicit usage" do
    describe "createInfo MUST be a pointer to a valid XrInstanceCreateInfo structure" do
      describe "if createInfo is NULL" do
        it "returns XR_ERROR_VALIDATION_FAILURE" do
          expect(xrCreateInstance(nil, @response)).to eql(XR_ERROR_VALIDATION_FAILURE)
        end
      end
    end

    describe "instance MUST be a pointer to an XrInstance handle" do
      describe "if instance is NULL" do
        it "returns XR_ERROR_VALIDATION_FAILURE" do
          expect(xrCreateInstance(@request, nil)).to eql(XR_ERROR_VALIDATION_FAILURE)
        end
      end
    end
  end

  describe "when validating XrInstanceCreateInfo usage" do
    describe "type MUST be XR_TYPE_INSTANCE_CREATE_INFO" do
      describe "if type is XR_TYPE_UNKNOWN" do
        it "returns XR_ERROR_VALIDATION_FAILURE" do
          @request[:base][:type] = XR_TYPE_UNKNOWN
          expect(xrCreateInstance(@request, @response)).to eql(XR_ERROR_VALIDATION_FAILURE)
        end
      end
    end

    describe "next MUST be NULL or a valid pointer to the next structure" do
      describe "if next is NULL" do
        it "returns XR_SUCCESS" do
          begin
            @request[:base][:next] = nil
            expect(xrCreateInstance(@request, @response)).to eql(XR_SUCCESS)
          ensure
            xrDestroyInstance(@response[:handle])
          end
        end
      end
    end

    describe "createFlags MUST be 0" do
      describe "if createFlags is 1" do
        it "returns XR_ERROR_VALIDATION_FAILURE" do
          @request[:createFlags] = 1
          expect(xrCreateInstance(@request, @response)).to eql(XR_ERROR_VALIDATION_FAILURE)
        end
      end
    end

    describe "applicationInfo MUST be a valid XrApplicationInfo structure" do
      # TODO
    end

    describe "enabledApiLayerCount and enabledApiLayerNames MUST be valid" do
      describe "if enabledApiLayerCount is not 0" do
        it "enabledApiLayerNames MUST be a pointer to an array of enabledApiLayerCount NUL-terminated UTF-8 strings" do
          # TODO
        end
      end

      describe "if a specified API layer cannot be found" do
        it "returns XR_ERROR_API_LAYER_NOT_PRESENT" do
          # TODO
        end
      end
    end

    describe "enabledExtensionCount and enabledExtensionNames MUST be valid" do
      describe "if enabledExtensionCount is not 0" do
        it "enabledExtensionNames MUST be a pointer to an array of enabledExtensionCount NUL-terminated UTF-8 strings" do
          # TODO
        end
      end

      describe "if a specified extension cannot be found" do
        it "returns XR_ERROR_EXTENSION_NOT_PRESENT" do
          # TODO
        end
      end
    end

    describe "applicationName MUST be a NUL-terminated UTF-8 string whose length is <= XR_MAX_APPLICATION_NAME_SIZE" do
      describe "if applicationName is the empty string" do
        it "returns XR_ERROR_NAME_INVALID" do
          @request[:applicationInfo][:applicationName] = ""
          expect(xrCreateInstance(@request, @response)).to eql(XR_ERROR_NAME_INVALID)
        end
      end

      describe "if applicationName is not NUL-terminated" do
        it "returns XR_ERROR_NAME_INVALID" do
          @request[:applicationInfo][:applicationName] = "X" * XR_MAX_APPLICATION_NAME_SIZE
          expect(xrCreateInstance(@request, @response)).to eql(XR_ERROR_NAME_INVALID)
        end
      end

      describe "if applicationName is not valid UTF-8" do
        # TODO: test for invalid UTF-8
      end
    end

    describe "engineName MUST be a NUL-terminated UTF-8 string whose length is <= XR_MAX_ENGINE_NAME_SIZE" do
      describe "if engineName is the empty string" do
        it "returns XR_SUCCESS" do
          begin
            @request[:applicationInfo][:engineName] = ""
            expect(xrCreateInstance(@request, @response)).to eql(XR_SUCCESS)
          ensure
            xrDestroyInstance(@response[:handle])
          end
        end
      end

      describe "if engineName is not NUL-terminated" do
        it "returns XR_ERROR_NAME_INVALID" do
          @request[:applicationInfo][:engineName] = "X" * XR_MAX_ENGINE_NAME_SIZE
          expect(xrCreateInstance(@request, @response)).to eql(XR_ERROR_NAME_INVALID)
        end
      end

      describe "if engineName is not valid UTF-8" do
        # TODO: test for invalid UTF-8
      end
    end

    describe "apiVersion MUST be valid" do
      describe "if the runtime does not support the requested apiVersion" do
        it "returns XR_ERROR_API_VERSION_UNSUPPORTED" do
          @request[:applicationInfo][:apiVersion] = 0xFFFFFFFFFFFFFFFF
          expect(xrCreateInstance(@request, @response)).to eql(XR_ERROR_API_VERSION_UNSUPPORTED)
        end
      end
    end
  end

  describe "when validating XrInstanceCreateInfo extensions" do
    describe "next MUST be NULL or a valid pointer to the next structure" do
      describe "if the structure contains a platform-specific extension for a platform other than the target platform" do
        it "returns XR_ERROR_INITIALIZATION_FAILED" do
          # TODO
        end
      end
    end
  end

  # TODO: more tests for xrCreateInstance
end
