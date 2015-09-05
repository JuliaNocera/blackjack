class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('dealerHand').stand()
      @compareScores()

  # Access player and dealer scores
  # Need to find way to access this in HandView


  # Possible solution: create a sepate file that has a function which has access
  # to both scores. Then run this function where we need it.
  compareScores: ->
    playerScore = @model.get('playerHand').scores()[0]
    dealerScore = @model.get('dealerHand').scores()[0]
    if dealerScore > 21 then alert('You win')
    else if dealerScore > playerScore then alert('Dealer wins')
    else alert('You win')
    $('body').empty()
    new AppView(model: new App()).$el.appendTo 'body'


  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

