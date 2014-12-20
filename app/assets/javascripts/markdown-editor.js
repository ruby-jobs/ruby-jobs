$(function() {
  new Vue({
    el: '.markdown-editor',
    filters: {
      marked: function(value) {
        if(!value) {
          return "...";
        } else {
          return marked(value);
        }
      }
    }
  });
});
