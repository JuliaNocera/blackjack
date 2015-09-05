class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('stand', @compareScores, @)
    @get('playerHand').on('hit', @scoreCheck, @)


  compareScores: ->
    @get('dealerHand').models[0].flip()
    playerScore = @get('playerHand').scores()[0]
    dealerScore = @get('dealerHand').scores()[0]
    while dealerScore < 17
      @get('dealerHand').add(@get('deck').pop())
      dealerScore = @get('dealerHand').scores()[0]
    if dealerScore > 21 then alert('You win')
    else if dealerScore > playerScore then alert('Dealer wins')
    else alert('You win')
    $('body').empty()
    new AppView(model: new App()).$el.appendTo 'body'


  scoreCheck: (song) ->
    if song.scores()[0] > 21
      alert('You Lose!')
      $('body').empty()
      new AppView(model: new App()).$el.appendTo 'body'


