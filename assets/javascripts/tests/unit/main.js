(function() {
  describe('Controller - Example', function() {
    beforeEach(function() {
      return inject(function($rootScope, $controller) {
        var scope;
        return scope = $rootScope.$new();
      });
    });
    return it('Should load test', function() {
      return expect(true).toBe(true);
    });
  });

}).call(this);
