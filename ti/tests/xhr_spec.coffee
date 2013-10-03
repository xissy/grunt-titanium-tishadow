
describe 'XHR Test', ->
  xhr = Ti.Network.createHTTPClient()

  it 'GET', ->
    responseText = null
    isFinished = false
    isError = false

    # Jasmine Asynchronous Support.
    # http://pivotal.github.io/jasmine/#section-Asynchronous_Support
    runs ->
      xhr.onload = ->
        responseText = @.responseText
        isFinished = true

      xhr.onerror = ->
        isError = true
        isFinished = true

      xhr.open 'GET', 'http://www.google.com'
      xhr.send()

    waitsFor ->
      return isFinished
    ,
      "xhr", 10000

    runs ->
      expect(isFinished).toBe(true)
      expect(isError).toBe(false)
