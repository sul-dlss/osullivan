require File.join(File.dirname(__FILE__), 'abstract_resource')

module IIIF
  module V3
    module Presentation
      class AnnotationPage < AbstractResource

        TYPE = 'AnnotationPage'

        def required_keys
          super + %w{ id }
        end

        def array_only_keys;
          super + %w{ items };
        end

        def initialize(hsh={})
          hsh['type'] = TYPE unless hsh.has_key? 'type'
          super(hsh)
        end

        def validate
          # Each member or resources must be a kind of Annotation
        end

      end
    end
  end
end
