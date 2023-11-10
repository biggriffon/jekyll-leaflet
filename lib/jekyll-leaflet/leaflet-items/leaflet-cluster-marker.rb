require "securerandom"
require_relative("../_parse-liquid.rb")

module Jekyll
    class LeafletClusterMarker < Liquid::Tag

        def initialize(tag_name, input, tokens)
            super
            if input.empty?
                @input = '{}'
            else
                @input = input
            end
        end

        def render(context)
            value = parse_liquid_output_in(@input, context)
            '{id: "' + SecureRandom.hex + '",
              type: "LeafletClusterMarker",
              value: ' + value + '},'
        end
    end
end

Liquid::Template.register_tag('leaflet_cluster_marker', Jekyll::LeafletClusterMarker)
