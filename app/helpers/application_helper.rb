module ApplicationHelper
  include Pagy::Frontend

  def pagination(obj)
    pagy_bootstrap_nav(obj) if obj.pages > 1
  end

  def i18n_model_name(model, count: 1)
    model.model_name.human(count: count)
  end

  def attribute_model(model, attr)
    model.class.human_attribute_name(attr)
  end

  def full_title(page_title = '')
    base_title = t('page.site_name')
    page_title ? "#{page_title} | #{base_title}" : "#{base_title}"
  end

  def currently_at(current_page = '')
    render partial: 'shared/menu', locals: { current_page: current_page }
  end

  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page
    css_text = current_page == title ? 'text-success' : 'text-black'
    options[:class] = if options[:class]
                        (options[:class] + ' ' + css_text)
                      else
                        css_text
                      end

    link_to title, url, options
  end
end
