//= require i18n
//= require i18n/translations


//= require pageflow/editor/base
//= require pageflow/before_after/editor
//= require pageflow/text_page/editor
//= require pageflow/embedded_video/editor
//= require pageflow/internal_links/editor
//= require pageflow/external_links/editor
//= require pageflow/linkmap_page/editor
//= require pageflow/chart/editor

pageflow.ready.then(function() {
  _.extend(pageflow.Configuration.prototype.defaults, {gradient_opacity: 0});
});
