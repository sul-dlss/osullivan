describe IIIF::V3::Service do

  describe 'self#get_descendant_class_by_jld_type' do
    before do
      class DummyClass < IIIF::V3::Service
        TYPE = "Collection"
        def self.singleton_class?
          true
        end
      end
    end
    after do
      Object.send(:remove_const, :DummyClass)
    end
    it 'gets the right class' do
      klass = described_class.get_descendant_class_by_jld_type('Canvas')
      expect(klass).to eq IIIF::V3::Presentation::Canvas
    end
    context "when there are singleton classes which are returned" do
      it "gets the right class" do
        allow(IIIF::V3::Service).to receive(:descendants).and_return([DummyClass, IIIF::V3::Presentation::Collection])
        klass = described_class.get_descendant_class_by_jld_type('Collection')
        expect(klass).to eq IIIF::V3::Presentation::Collection
      end
    end
  end

  describe '#validate' do
    # TODO:
    #  see http://prezi3.iiif.io/api/annex/services
    # * check for required keys
    # @context is required
    # Image service:   The service must have the @context, @id and profile keys
    # GeoJSON:   @context http://geojson.org/contexts/geojson-base.jsonld should be used
    # Physical Dimension

    # * type check Array-only values
    # * type check String-only values
    # * type check Integer-only values
    # * type check AbstractResource-only values

    it 'raises an error if @context is missing' do
      expect { subject.validate }.to raise_error IIIF::V3::Presentation::MissingRequiredKeyError
    end
  end


  describe '#initialize' do
    it 'assigns hash values passed in' do
      image_context_uri = 'http://iiif.io/api/image/2/context.json'
      id_uri = "https://stacks.stanford.edu/image/iiif/wy534zh7137%2FSULAIR_rosette"
      profile_uri = "http://iiif.io/api/image/2/level1.json"
      service_obj = IIIF::V3::Service.new({
        '@context' => image_context_uri,
        'id' => id_uri,
        'profile' => profile_uri
      })
      expect(service_obj.keys.size).to eq 3
      expect(service_obj['id']).to eq id_uri
      expect(service_obj['@context']).to eq image_context_uri
      expect(service_obj['profile']).to eq profile_uri
    end
    it 'works with "@id" as a key' do
      id_uri = "https://stacks.stanford.edu/image/iiif/wy534zh7137%2FSULAIR_rosette"
      service_obj = IIIF::V3::Service.new({
        '@id' => id_uri,
      })
      expect(service_obj.keys.size).to eq 1
      expect(service_obj['@id']).to eq id_uri
    end
  end

  # from bc592pz8308 v3 manifest
#   {
#         "@context": "http://iiif.io/api/image/2/context.json",
#         "@id": "https://stacks.stanford.edu/image/iiif/wy534zh7137%2FSULAIR_rosette",
#         "id": "https://stacks.stanford.edu/image/iiif/wy534zh7137%2FSULAIR_rosette",
#         "profile": "http://iiif.io/api/image/2/level1.json"
#       }
#       "service": {
#          "@context": "http://iiif.io/api/image/2/context.json",
#          "@id": "https://stacks.stanford.edu/image/iiif/bc592pz8308%2Fbc592pz8308_05_0001",
#          "id": "https://stacks.stanford.edu/image/iiif/bc592pz8308%2Fbc592pz8308_05_0001",
#          "profile": "http://iiif.io/api/image/2/level1.json"
#        }
# }
#

# bigger example
# {
#   "service": {
#     "@context" : "http://iiif.io/api/image/2/context.json",
#     "@id" : "http://www.example.org/image-service/abcd1234",
#     "protocol": "http://iiif.io/api/image",
#     "width" : 6000,
#     "height" : 4000,
#     "sizes" : [
#       {"width" : 150, "height" : 100},
#       {"width" : 600, "height" : 400},
#       {"width" : 3000, "height": 2000}
#     ],
#     "tiles": [
#       {"width" : 512, "scaleFactors" : [1,2,4,8,16]}
#     ],
#     "profile" : [
#       "http://iiif.io/api/image/2/level2.json",
#       {
#         "formats" : [ "gif", "pdf" ],
#         "qualities" : [ "color", "gray" ],
#         "supports" : [
#             "canonicalLinkHeader", "rotationArbitrary", "http://example.com/feature"
#         ]
#       }
#     ]
#   }
# }

end
