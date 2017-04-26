//= require pageflow/base
//= require pageflow/before_after
//= require pageflow/text_page
//= require pageflow/embedded_video
//= require pageflow/internal_links
//= require pageflow/external_links
//= require pageflow/linkmap_page
//= require scrollytelling/loading_spinner
//= require scrollytelling/pageflow/navigation

pageflow.ready.then(function(result) {
  // we override the feature detection that disables atmo on mobile.
  pageflow.atmo.enable();
});

function recompile() {
  return true;
}
