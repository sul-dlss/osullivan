describe IIIF::V3::Presentation::Resource do

  describe "#{described_class}.define_methods_for_abstract_resource_only_keys" do
    it_behaves_like 'it has the appropriate methods for abstract_resource_only_keys v3'
  end

  describe "#{described_class}.int_only_keys" do
    it_behaves_like 'it has the appropriate methods for integer-only keys v3'
  end

  describe "#{described_class}.numeric_only_keys" do
    it_behaves_like 'it has the appropriate methods for numeric-only keys v3'
  end

  describe "#{described_class}.define_methods_for_string_only_keys" do
    it_behaves_like 'it has the appropriate methods for string-only keys v3'
  end

  describe '#validate' do
    # A content resource must have exactly one id unless it is embedded in the response, and it must be the http(s) URI at which the resource is published.
  end
end
