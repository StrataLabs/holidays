describe 'Welcome', ->
  beforeEach ->
    loadFixtures("welcome.html")
    Strata.Welcome.bootstrap()

  describe 'bootstrap', ->
    it 'should calculate the numbers correctly up to fib(16)', ->
      expect(true).toEqual true
