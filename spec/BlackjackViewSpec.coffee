assert = chai.assert
expect = chai.expect

describe 'app model', ->
  app = null

  beforeEach ->
    app = new App()

  describe 'compareScores', ->
    it 'should be a method of the app model', ->
      expect(app).to.have.property 'compareScores'

  describe 'scoreCheck', ->
    it 'should be a method of the app model', ->
      expect(app).to.have.property 'scoreCheck'


