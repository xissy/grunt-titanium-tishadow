describe('XHR Test', function() {
  var xhr;
  xhr = Ti.Network.createHTTPClient();
  return it('GET', function() {
    var isError, isFinished, responseText;
    responseText = null;
    isFinished = false;
    isError = false;
    runs(function() {
      xhr.onload = function() {
        responseText = this.responseText;
        return isFinished = true;
      };
      xhr.onerror = function() {
        isError = true;
        return isFinished = true;
      };
      xhr.open('GET', 'http://www.google.com');
      return xhr.send();
    });
    waitsFor(function() {
      return isFinished;
    }, "xhr", 10000);
    return runs(function() {
      expect(isFinished).toBe(true);
      return expect(isError).toBe(false);
    });
  });
});

/*
//@ sourceMappingURL=xhr_spec.js.map
*/