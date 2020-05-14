# This is free and unencumbered software released into the public domain.

require 'openxr'

include OpenXR::API

# See: https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#xrDestroyInstance
RSpec.describe "xrDestroyInstance" do
  describe "when validating implicit usage" do
    describe "instance MUST be a valid XrInstance handle" do
      describe "if instance is NULL" do
        it "returns XR_ERROR_HANDLE_INVALID" do
          expect(xrDestroyInstance(nil)).to eql(XR_ERROR_HANDLE_INVALID)
        end
      end
    end
  end

  describe "when given a valid instance handle" do
    describe "after destroying the instance" do
      it "returns XR_SUCCESS" do
        OpenXR::Instance.create($0) do |instance|
          expect(xrDestroyInstance(instance.handle)).to eql(XR_SUCCESS)
          instance.instance_variable_set(:@struct, nil)
        end
      end
    end
  end
end
