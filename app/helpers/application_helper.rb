module ApplicationHelper
  def default_meta_tags
    {
      site: "#{t("controller.#{controller_name}")} | #{t('website.title')}",
      description: t('website.desc'),
      keywords: t('website.keywords'), 
      reverse: true
    }
  end
end
