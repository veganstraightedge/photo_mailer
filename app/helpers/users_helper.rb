module UsersHelper
  def placeholder_profile_image_url size: 600
    hex_range = (0..9).to_a + ('a'..'f').to_a
    color = [hex_range.sample, hex_range.sample, hex_range.sample].join
    "https://via.placeholder.com/#{size}/#{color}?text=+"
  end

  def avatar_image_tag user:, width: nil, tilt: false, shadow: true
    classes = []
    classes << 'rounded'
    classes << 'shadow' if shadow
    classes << random_tilted_class if tilt

    url = if false # TODO:  user.avatar.attached?
            user.avatar.variant(resize_to_limit: [width, width])
          else
            placeholder_profile_image_url size: width
          end

    image_tag url, class: classes.join(' ')
  end

  def random_tilted_class
    "tilted-#{rand(1..13)}"
  end

  def age_badge_for user
    if user.adult?
      adult_badge
    elsif user.child?
      child_badge
    elsif user.age_unknown?
      age_unknown_badge
    end
  end

  def age_verification_status_badge user: Current.user
    send "#{user.age_verification_status}_badge"
  end

  def strip_url_protocol url
    url.gsub('https://', '').gsub('http://', '')
  end

  private

  def adult_badge
    content_tag :span, 'Adult', class: 'badge bg-info'
  end

  def child_badge
    content_tag :span, 'Child', class: 'badge bg-danger'
  end

  def age_unknown_badge
    content_tag :span, 'Age unknown', class: 'badge bg-primary'
  end

  def pending_badge
    content_tag :span, 'PENDING', class: 'badge bg-warning text-dark'
  end

  def rejected_badge
    content_tag :span, 'REJECTED', class: 'badge bg-danger'
  end

  def approved_badge
    content_tag :span, 'APPROVED', class: 'badge bg-success'
  end
end
