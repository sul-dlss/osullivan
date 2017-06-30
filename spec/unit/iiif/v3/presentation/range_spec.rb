describe IIIF::V3::Presentation::Range do

  let(:fixed_values) do
    {
      'id' => 'http://www.example.org/iiif/book1/range/r1',
      'type' => 'Range',
      'label' => 'Introduction',
      'members' => [
        {
          "id" => 'http://www.example.org/iiif/book1/range/r1-1',
          "type" => "Range"
        },
        {
          "id" => 'http://www.example.org/iiif/book1/range/r1-2',
          "type" => "Range"
        },
        {
          "id" => 'http://www.example.org/iiif/book1/canvas/p1',
          "type" => "Canvas"
        },
        {
          "id" => 'http://www.example.org/iiif/book1/canvas/p2',
          "type" => "Canvas"
        },
        {
          "id" => 'http://www.example.org/iiif/book1/canvas/p3#xywh=0,0,750,300',
          "type" => "Canvas"
        }
      ]
    }
  end

  describe '#initialize' do
    it 'sets type to Range by default' do
      expect(subject['type']).to eq 'Range'
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
    # A Range must have exactly one id, and it must be an http(s) URI.

  end

end
