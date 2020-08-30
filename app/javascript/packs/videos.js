var InfiniteScroll = require('infinite-scroll')
var infScroll = new InfiniteScroll( '.grid', {
    // options
    path: 'videos/paginate/{{#}}',
    append: '.video',
    history: false,
    scrollThreshold: 600
});


