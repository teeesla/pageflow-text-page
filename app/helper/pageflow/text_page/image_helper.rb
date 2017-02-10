module Pageflow
  module TextPage
    module ImageHelper
      def content_image(id, alt, format = :medium)
        image = Pageflow::ImageFile.find_by_id(id)
        if image
          image_tag(image.attachment.url(:medium))
        else
          ''
        end
      end

      def content_image_large(id, alt, format = :large)
        image = Pageflow::ImageFile.find_by_id(id)
        if image
          image_tag(image.attachment.url(:large))
        else
          ''
        end
      end

      def fullscreen_image_url(id, format = :large)
        image = Pageflow::ImageFile.find_by_id(id)
        if image
          return image.attachment.url(:large)
        else
          '#'
        end
      end

      def background_asset_present_css_class(configuration)
        file =
          if configuration['background_type'] == 'video'
            Pageflow::VideoFile.find_by_id(configuration['video_file_id'])
          else
            Pageflow::ImageFile.find_by_id(configuration['background_image_id'])
          end

        file ? '' : 'no_background_asset'
      end
    end
  end
end
