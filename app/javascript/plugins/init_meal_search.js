const initMealSearch = () => {
  var client = algoliasearch(APPLICATION_ID, SEARCH_ONLY_API_KEY);
  var index = client.initIndex('Meal');

  index.search('something', { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      console.log(content)
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
};

export { initMealSearch };
