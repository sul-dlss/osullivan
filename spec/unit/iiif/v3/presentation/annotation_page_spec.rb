describe IIIF::V3::Presentation::AnnotationPage do

  describe "#{described_class}.define_methods_for_array_only_keys" do
    it_behaves_like 'it has the appropriate methods for array-only keys v3'
  end

  describe '#validate' do
    # An AnnotationPage must have exactly one id, and it must be the http(s) URI at which it is published.
    # Each member or resources must be a kind of Annotation
    # An AnnotationCollection must have at least one label
  end

end
