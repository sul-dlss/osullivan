describe IIIF::V3::Presentation::Collection do

  let(:fixed_values) do
    {
      "@context" => [
        "http://iiif.io/api/presentation/3/context.json",
        "http://www.w3.org/ns/anno.jsonld"
      ],
      'id' => 'http://example.org/iiif/collection/top',
      'type' => 'Collection',
      'label' => 'Top Level Collection for Example Organization',
      'description' => 'Description of Collection',
      'attribution' => 'Provided by Example Organization',

      'collections' => [
        { 'id' => 'http://example.org/iiif/collection/part1',
          'type' => 'Collection',
          'label' => 'Sub Collection 1'
         },
         { 'id' => 'http://example.org/iiif/collection/part2',
           'type' => 'Collection',
           'label' => 'Sub Collection 2'
          }
      ],
      'manifests' => [
        { 'id' => 'http://example.org/iiif/book1/manifest',
          'type' => 'Manifest',
          'label' => 'Book 1'
        }
      ]
    }
  end

  describe '#initialize' do
    it 'sets type to Collection by default' do
      expect(subject['type']).to eq 'Collection'
    end
  end

  describe "#{described_class}.define_methods_for_array_only_keys" do
    it_behaves_like 'it has the appropriate methods for array-only keys v3'
  end

  describe "#{described_class}.define_methods_for_string_only_keys" do
    it_behaves_like 'it has the appropriate methods for string-only keys v3'
  end

  describe "#{described_class}.define_methods_for_any_type_keys" do
    it_behaves_like 'it has the appropriate methods for any-type keys v3'
  end

  describe '#validate' do
    # A Collection must have exactly one id, and it must be the http(s) URI at which it is published.
    # A Collection must have at least one label.

    # from v3 doc but v2?
    # collections must have a label, and should have metadata and description properties
    # manifests must not be embedded within collections
    # Collections have three list-based properties to express membership:
    #   collections - References to sub-collections of the current collection. Each referenced collection must have the appropriate id, type and label, and may be embedded in its entirety.
    #   manifests - References to manifests contained within the current collection. Each referenced manifest must have the appropriate id, type and label.
    #   members - In cases where the order of a collection is significant, members can be used to interleave both collection and manifest resources


    # from v2?
    # each member of collections and manifests must be a Hash
    # each member of collections and manifests MUST have id, type, and label
  end

end
