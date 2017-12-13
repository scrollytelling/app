// pageflow
//= require pageflow/base

// pageflow plugins
//= require pageflow/internal_links
//= require pageflow/external_links
//= require pageflow/linkmap_page
//= require pageflow/text_page
//= require pageflow/embedded_video
//= require pageflow/before_after
//= require pageflow/chart
//= require pageflow/localfocus

// scrollytelling
//= require scrollytelling/loading_spinner
//= require scrollytelling/navigation

// stuff we need
//= require autotrack

pageflow.ready.then(function(result) {
  // we override the feature detection that disables atmo on mobile.
  pageflow.atmo.enable();
});
