module AssetsHelper
  def asset_display_tag asset, classes: nil
    # TODO: re-enable after 7.0.3 ships
    # if asset.image?
    #   image_tag asset, class: classes
    # elsif asset.video?
    #   video_tag asset, class: classes
    # end

    image_tag asset, class: classes
  end

  def asset_preview_tag asset, size: 400, classes: nil
    variant_args = { resize_to_limit: [size, size] }

    if asset.image?
      variant = asset.variant(variant_args)
      image_tag variant, class: classes
    elsif asset.video?
      variant = asset.preview(variant_args)
      # TODO: re-enable after 7.0.3 ships
      # video_tag variant, class: classes
      image_tag variant, class: classes
    end
  end

  def asset_square_preview_tag post, size: 600, classes: nil
    variant_args = { resize_to_fill: [size, size, { gravity: 'Center' }] }

    if post.assets.first.image?
      variant = post.assets.first.variant(variant_args)
      image_tag variant, class: classes
    elsif post.assets.first.video?
      variant = post.assets.first.preview(variant_args)
      # TODO: re-enable after 7.0.3 ships
      # video_tag variant, class: classes
      image_tag variant, class: classes
    end
  end
end
