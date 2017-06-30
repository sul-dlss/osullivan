describe IIIF::V3::Presentation::Annotation do

  describe "#{described_class}.define_methods_for_abstract_resource_only_keys" do
    it_behaves_like 'it has the appropriate methods for abstract_resource_only_keys v3'
  end

  describe '#validate' do
    # are we producing syntactically correct annotations?

    # required:
    #   id (URI?)  : Annotation must have exactly one id, and the Annotation’s representation should be published at that URI.
    #   type "Annotation"
    #   motivation  ('painting' unless ...)
    #   target (URI?)
    it 'raises an error if time_mode isn\'t an allowable value' do
      subject['time_mode'] = 'foo'
      expect { subject.validate }.to raise_error IIIF::V3::Presentation::IllegalValueError
    end
  end

  # should
  #   body
  #      have a test when there isn't a body;  have a test when there is a body
  #   if there is a body:
  #      id, type, format   (but Choice ...)
  #      including commonly label, description, metadata, rights and attribution

  # the format " must be the media type that is returned when the resource is dereferenced"
  # the content resources may also have any of the other fields defined in this specification, including commonly label, description, metadata, rights and attribution.


  # if it has a resource, it should have ?
    #  id
    #  type
    #  format

  # it MUST have a "target" (SHOULD be identified by HTTP URIs)
  # it should have a "body" (SHOULD be identified by HTTP URIs)


#examples:
{
   "id":"http://tomcrane.github.io/scratch/manifests/3/3d/anno1",
   "type":"Annotation",
   "motivation":"painting",
   "body":{
      "id":"http://files.universalviewer.io/manifests/nelis/animal-skull/animal-skull.json",
      "type":"PhysicalObject",
      "format":"application/vnd.threejs+json",
      "label":"Animal Skull"
   },
   "target":"http://tomcrane.github.io/scratch/manifests/3/canvas/3d"
}


{
"id":"http://tomcrane.github.io/scratch/annos/3/anno/1",
  "type":"Annotation",
  "motivation":"painting",
  "body":{
      "type":"Choice",
      "choiceHint":"client",
      "items":[
          {
              "id":"http://example.org/foo.mp4",
              "type":"Video",
              "format":"video/mp4; codec..xxxxx"
          },
          {
              "id":"http://example.org/foo.webm",
              "type":"Video",
              "format":"video/webm"
          }
      ]
  },
  "target":"http://tomcrane.github.io/scratch/manifests/3/canvas/1"
}


{
    "id":"...",
    "type":"Annotation",
    "motivation":"painting",
    "body":{
       "id":"http://example.org/iiif/foo2.mp3",
       "type":"Audio"
    },
    "target":"http://tomcrane.github.io/scratch/manifests/3/canvas/2"
 }

 {
     "type" : "Annotation",
     "motivation" : "painting",
     "target" : "https://purl.stanford.edu/vv985tj8656/iiif/canvas/vv985tj8656_1",
     "body" : {
        "id" : "https://stacks.stanford.edu/image/iiif/vv985tj8656%2Fvv985tj8656_00_0001/full/full/0/default.jpg",
        "type" : "Image",
        "format" : "image/jpeg",
        "width" : 9260,
        "height" : 7412,
        "service" : {
           "@id" : "https://stacks.stanford.edu/image/iiif/vv985tj8656%2Fvv985tj8656_00_0001",
           "@context" : "http://iiif.io/api/image/2/context.json",
           "profile" : "http://iiif.io/api/image/2/level1.json"
        }
     },
     "id" : "https://purl.stanford.edu/vv985tj8656/iiif/annotation/vv985tj8656_1"
  }
  {
      "id":"http://tomcrane.github.io/scratch/manifests/3/pdf/anno1",
      "type":"Annotation",
      "motivation":"painting",
      "body":{
         "id":"http://example.org/iiif/some-document.pdf",
         "type":"Document",
         "format":"application/pdf"
      },
      "target":"http://tomcrane.github.io/scratch/manifests/3/canvas/99"
   },
   {
      "id":"http://tomcrane.github.io/scratch/manifests/3/pdf/anno2",
      "type":"Annotation",
      "motivation":"painting",
      "body":{
         "id":"http://example.org/iiif/cover-image.jpg",
         "type":"Image",
         "format":"image/jpg"
      },
      "target":"http://tomcrane.github.io/scratch/manifests/3/canvas/99"
}

end
