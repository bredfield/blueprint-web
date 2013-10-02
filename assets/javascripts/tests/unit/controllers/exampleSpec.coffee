describe 'Controller - Example', ()->
  
  beforeEach ()->
    # module('Rounded')

    inject ($rootScope, $controller)->
      scope = $rootScope.$new()
      # ctrl = $controller('instagram', $scope:scope)
    
  it 'Should load test', ()->
    expect(true).toBe(true)
